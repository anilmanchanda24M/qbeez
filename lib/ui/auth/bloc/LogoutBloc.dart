import 'package:qubeez/data/base/base_bloc.dart';
import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/logout_response.dart';
import 'package:rxdart/rxdart.dart';

class LogoutBloc extends BaseBloc {
  final _logoutStream = PublishSubject<LogoutResponse>();
  final _loadingStream = PublishSubject<bool>();
  final _errorStream = PublishSubject<Error>();

  Stream<LogoutResponse> get logoutStream => _logoutStream.stream;

  Stream<bool> get loadingStream => _loadingStream.stream;

  Stream<Error> get errorStream => _errorStream.stream;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _logoutStream?.close();
    _loadingStream?.close();
    _errorStream?.close();
  }

  void logout(String accessToken) async {
    print("calling");
    if (isLoading) return;
    isLoading = true;
    _loadingStream.sink.add(true);
    LogoutResponse logoutResponse = await repository.logout(accessToken);
    isLoading = false;
    _loadingStream.sink.add(isLoading);
    _logoutStream.sink.add(logoutResponse);
  }
}
