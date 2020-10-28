import 'package:qubeez/data/base/base_bloc.dart';
import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/logout_response.dart';
import 'package:qubeez/model/auth/verify_otp_response.dart';
import 'package:rxdart/rxdart.dart';

class ForgotPasswordBloc extends BaseBloc {
  final _forgotPasswordStream = PublishSubject<LogoutResponse>();
  final _loadingStream = PublishSubject<bool>();
  final _errorStream = PublishSubject<Error>();

  Stream<LogoutResponse> get forgotPasswordStream => _forgotPasswordStream.stream;

  Stream<bool> get loadingStream => _loadingStream.stream;

  Stream<Error> get errorStream => _errorStream.stream;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _forgotPasswordStream?.close();
    _loadingStream?.close();
    _errorStream?.close();
  }

  void forgotPassword(String userCred, String password, String otp) async {
    print("calling");
    if (isLoading) return;
    isLoading = true;
    _loadingStream.sink.add(true);
    LogoutResponse loginData = await repository.ForgotPassword(userCred, otp, password);
    isLoading = false;
    _loadingStream.sink.add(isLoading);
    _forgotPasswordStream.sink.add(loginData);
  }
}
