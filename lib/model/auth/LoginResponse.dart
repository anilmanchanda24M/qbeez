
import 'package:qubeez/model/auth/user.dart';

class LoginResponse {
  bool status;
  String message;
  User data;
  WalletData walletData;

  LoginResponse(this.status, this.message, this.data, this.walletData);

  LoginResponse.fromJson(Map<String, dynamic> json) {
    this.status = json['status'] == null ? null : json['status'];
    this.message = json['message'] == null ? null : json['message'];
    data = json['data'] == null ? null : User.fromJson(json['data']);
    walletData = json['wallet_data'] == null ? null : WalletData.fromJson(json['wallet_data']);
  }

  LoginResponse.fromError(String errorValue, int errorCode) {
    this.message = errorValue;
    // this.errorCode = errorCode;
  }
}