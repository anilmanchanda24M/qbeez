import 'package:qubeez/model/auth/user.dart';

class VerifyOtpResponse{
  bool status;
  String message;
  User data;
  WalletData walletData;

  VerifyOtpResponse(this.status, this.message, this.data);

  VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    this.status = json['status'] == null ? null : json['status'];
    this.message = json['message'] == null ? null : json['message'];
    data = json['data'] == null ? null : User.fromJson(json['data']);
    walletData = json['wallet_data'] == null ? null : WalletData.fromJson(json['wallet_data']);
  }

  VerifyOtpResponse.fromError(String errorValue, int statusCode) {
    this.message = errorValue;
  }
}