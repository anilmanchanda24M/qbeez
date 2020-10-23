import 'package:qubeez/model/auth/LoginResponse.dart';
import 'package:qubeez/model/auth/SignUpResponse.dart';

import 'network_api.dart';

class Repository{

  final apiProvider = ApiProvider();

  Future<SignUpResponse> signUp(String fullName, String email, String phone, String password) =>
      apiProvider.signUp(fullName, email,
          phone, password);

  Future<LoginResponse> login(String userCred, String password,
      String longitude, String latitude, int roleType) =>
      apiProvider.login(userCred, password, longitude, latitude, roleType);
}