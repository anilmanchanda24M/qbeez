class SignUpResponse {
  bool status, verified;
  String message;
  String otp;
  UserSignUpData data;
  InputError inputError;

  SignUpResponse(this.status, this.message, this.otp, this.data, this.inputError);

  SignUpResponse.fromJson(Map<String, dynamic> json) {
    this.status = json['status'] == null ? null : json['status'];
    this.message = json['message'] == null ? null : json['message'];
    this.otp = json['otp'] == null ? null : json['otp'];
    this.data = json['data'] != null ? new UserSignUpData.fromJson(json['data']) : null;
    this.inputError = json['input_error'] == null ? null : InputError.fromJson(json['input_error']);
  }

  SignUpResponse.fromError(String errorValue, int statusCode) {
    this.message = errorValue;
  }
}

class InputError{
  List<String> mobile;
  List<String> email;

  InputError(this.mobile, this.email);

  InputError.fromJson(Map<String, dynamic> json){
    this.mobile =  (json['mobile'] as List).map((i) => i).toList();
    this.email =  (json['email'] as List).map((i) => i).toList();
  }
}

class ErrorData{
  String error;

  ErrorData(this.error);
}

class UserSignUpData{
  int id, user_type;
  String name, email, verification_code, country_code, mobile;

  UserSignUpData(this.id, this.user_type, this.name, this.email, this.verification_code,
      this.country_code, this.mobile);

  UserSignUpData.fromJson(Map<String, dynamic> json){
    id = json['id'] == 0 ? 0 : json['id'];
    user_type = json['user_type'] == 0 ? 0 : json['user_type'];
    name = json['name'] == null ? null : json['name'];
    email = json['email'] == null ? null : json['email'];
    verification_code = json['verification_code'] == null ? null : json['verification_code'];
    country_code = json['country_code'] == null ? null : json['country_code'];
    mobile = json['mobile'] == null ? null : json['mobile'];
  }
}