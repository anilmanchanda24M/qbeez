import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/SignUpResponse.dart';
import 'package:qubeez/utils/constant.dart';

class ApiProvider{
  final Dio _dioClient = Dio(BaseOptions(
      baseUrl: Constants.TESTING_URL,
      headers: {
        'Appversion': '1.0',
        'Ostype': Platform.isAndroid ? 'ANDRIOD' : 'ios'
      }));

  Future<SignUpResponse> signUp(String name, String email,
      String phone_number, String password, String firebase_token,
      String longitude, String latitude) async {

    final map = {
      "name": name,
      "email": email,
      "phone_number": phone_number,
      "password": password,
      "firebase_token": firebase_token,
      "longitude": longitude,
      "latitude": latitude
    };

    print("signup -> $map");
    try {
      Response response = await _dioClient.post('register', data: map);
      dynamic json = jsonDecode(response.toString());
      print(response.data);
      if (response.data != "") {
        print("dataValue :- ${json['success']}");
        if (json['success'] == true)
          return SignUpResponse.fromJson(json);
        else
          return SignUpResponse.fromError(
              json['message'], response.statusCode
          );
      } else {
        return SignUpResponse.fromError("No data", 396);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      var e = error;
      if (error is DioError) {
        e = getErrorMsg(e.type);
      }
      return SignUpResponse.fromError("$e", 397);
    }
  }

  Future<LoginResponse> login(String userCred, String password,
      String longitude, String latitude, int roleType) async {
    final map = {
      "user_cred": userCred,
      "password": password,
      "longitude": longitude,
      "latitude": latitude,
    };

    Dio _dioClient = Dio(BaseOptions(
      baseUrl: Constants.TESTING_URL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      headers: {
        'Appversion': '1.0',
        'Ostype': Platform.isAndroid ? 'android' : 'ios',
        'Roletype': roleType
      },
    ));
    try {
      Response response = await _dioClient.post('login', data: map);
      dynamic json = jsonDecode(response.toString());
      print(response.data);
      if (response.data != "") {
        print("dataValue :- ${json['success']}");
        if (json['success'] == true)
          return LoginResponse.fromJson(json);
        else
          return LoginResponse.fromError(
              json['message']/*,
            response.data['error_code'],*/
          );
      } else {
        return LoginResponse.fromError("No data"/*, 396*/);
      }
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      var e = error;
      if (error is DioError) {
        e = getErrorMsg(e.type);
      }
      return LoginResponse.fromError("$e"/*, 397*/);
    }
  }

  String getErrorMsg(DioErrorType type) {
    switch (type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return "Connection timeout";
        break;
      case DioErrorType.SEND_TIMEOUT:
        return "Send timeout";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return "Receive timeout";
        break;
      case DioErrorType.RESPONSE:
        return "Response timeout";
        break;
      case DioErrorType.CANCEL:
        return "Request has been cancelled";
        break;
      case DioErrorType.DEFAULT:
        return "Could not connect";
        break;
      default:
        return "Something went wrong";
        break;
    }
  }
}