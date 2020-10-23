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

  void signUpData(String name, String email, String phoneNumber, String password,
      String firebase_token, String longitude, String latitude) async {
    print("calling");
    if (isLoading) return;
    isLoading = true;
    _loadingStream.sink.add(true);
    SignUpResponse singUpData = await repository.signUp(name, email,
        phoneNumber, password, firebase_token, longitude, latitude);
    isLoading = false;
    _loadingStream.sink.add(isLoading);
    _signUpStream.sink.add(singUpData);


  }
}
