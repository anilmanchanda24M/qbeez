class LogoutResponse{
  bool status;
  String message;

  LogoutResponse(this.status, this.message);

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    this.status = json['status'] == null ? null : json['status'];
    this.message = json['message'] == null ? null : json['message'];
  }

  LogoutResponse.fromError(String errorValue, int statusCode) {
    this.message = errorValue;
  }
}