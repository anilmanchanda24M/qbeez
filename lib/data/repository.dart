import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/SignUpResponse.dart';

import 'network_api.dart';

class Repository{

  final apiProvider = ApiProvider();

  Future<SignUpResponse> signUp(
      String name, String email, String phoneNumber, String password,
      String firebase_token, String longitude, String latitude) =>
      apiProvider.signUp(name, email, phoneNumber, password, firebase_token,
          longitude, latitude);

  Future<LoginResponse> login(String userCred, String password,
      String longitude, String latitude, int roleType) =>
      apiProvider.login(userCred, password, longitude, latitude, roleType);
}