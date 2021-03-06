import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/SignUpResponse.dart';
import 'package:qubeez/model/auth/logout_response.dart';
import 'package:qubeez/model/auth/resend_otp_response.dart';
import 'package:qubeez/model/auth/verify_otp_response.dart';

import 'network_api.dart';

class Repository{

  final apiProvider = ApiProvider();

  Future<SignUpResponse> signUp(String fullName, String email,
      String phone, String password, String deviceToken) =>
      apiProvider.signUp(fullName, email, phone, password, deviceToken);

  Future<LoginResponse> login(String userCred, String password) =>
      apiProvider.login(userCred, password);

  Future<VerifyOtpResponse> verifyOtp(String userCred, String otp) =>
      apiProvider.verifyOtp(userCred, otp);

  Future<ResendOtpResponse> resendOtp(String userCred) =>
      apiProvider.resendOtp(userCred);

  Future<LogoutResponse> logout(String accessToken) =>
      apiProvider.logout(accessToken);

  Future<LogoutResponse> ForgotPassword(String userCred, String otp, String password) =>
      apiProvider.forgotPassword(userCred, password, otp);

}