
import 'package:qubeez/model/auth/user.dart';

class LoginResponse {
  bool success;
  String message;
  User user;

  LoginResponse(this.success, this.message, this.user);

  LoginResponse.fromJson(Map<String, dynamic> json) {
    this.success = json['success'] == null ? null : json['success'];
    this.message = json['message'] == null ? null : json['message'];
    this.user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  LoginResponse.fromError(String errorValue/*, int errorCode*/) {
    this.message = errorValue;
    // this.errorCode = errorCode;
  }
}