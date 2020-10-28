import 'package:qubeez/data/base/base_bloc.dart';
import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/verify_otp_response.dart';
import 'package:rxdart/rxdart.dart';

class VerifyOtpBloc extends BaseBloc {
  final _verifyOtpStream = PublishSubject<VerifyOtpResponse>();
  final _loadingStream = PublishSubject<bool>();
  final _errorStream = PublishSubject<Error>();

  Stream<VerifyOtpResponse> get verifyOtpStream => _verifyOtpStream.stream;

  Stream<bool> get loadingStream => _loadingStream.stream;

  Stream<Error> get errorStream => _errorStream.stream;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _verifyOtpStream?.close();
    _loadingStream?.close();
    _errorStream?.close();
  }

  void verifyOtp(String userCred, String otp) async {
    print("calling");
    if (isLoading) return;
    isLoading = true;
    _loadingStream.sink.add(true);
    VerifyOtpResponse verifyOtpResponse = await repository.verifyOtp(userCred, otp);
    isLoading = false;
    _loadingStream.sink.add(isLoading);
    _verifyOtpStream.sink.add(verifyOtpResponse);
  }
}
