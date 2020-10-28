import 'package:qubeez/data/base/base_bloc.dart';
import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/resend_otp_response.dart';
import 'package:qubeez/model/auth/verify_otp_response.dart';
import 'package:rxdart/rxdart.dart';

class ResendOtpBloc extends BaseBloc {
  final _resendOtpStream = PublishSubject<ResendOtpResponse>();
  final _loadingStream = PublishSubject<bool>();
  final _errorStream = PublishSubject<Error>();

  Stream<ResendOtpResponse> get resendOtpStream => _resendOtpStream.stream;

  Stream<bool> get loadingStream => _loadingStream.stream;

  Stream<Error> get errorStream => _errorStream.stream;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _resendOtpStream?.close();
    _loadingStream?.close();
    _errorStream?.close();
  }

  void resendOtp(String userCred) async {
    print("calling");
    if (isLoading) return;
    isLoading = true;
    _loadingStream.sink.add(true);
    ResendOtpResponse resendOtpResponse = await repository.resendOtp(userCred);
    isLoading = false;
    _loadingStream.sink.add(isLoading);
    _resendOtpStream.sink.add(resendOtpResponse);
  }
}
