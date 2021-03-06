import 'package:qubeez/data/base/base_bloc.dart';
import 'package:qubeez/model/auth/SignUpResponse.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc extends BaseBloc {
  final _signUpStream = PublishSubject<SignUpResponse>();
  final _loadingStream = PublishSubject<bool>();
  final _errorStream = PublishSubject<Error>();

  Stream<SignUpResponse> get signUpStream => _signUpStream.stream;

  Stream<bool> get loadingStream => _loadingStream.stream;

  Stream<Error> get errorStream => _errorStream.stream;
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _signUpStream?.close();
    _loadingStream?.close();
    _errorStream?.close();
  }

  void signUpData(String fullName, String email,
      String phone, String password, String deviceToken) async {
    print("calling");
    if (isLoading) return;
    isLoading = true;
    _loadingStream.sink.add(true);
    SignUpResponse singUpData = await repository.signUp(fullName, email,
        phone, password, deviceToken);
    isLoading = false;
    _loadingStream.sink.add(isLoading);
    _signUpStream.sink.add(singUpData);


  }
}
