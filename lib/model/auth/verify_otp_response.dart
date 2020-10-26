class VerifyOtpResponse{
  bool status;
  String message;

  VerifyOtpResponse(this.status, this.message);

  VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    this.status = json['status'] == null ? null : json['status'];
    this.message = json['message'] == null ? null : json['message'];
  }

  VerifyOtpResponse.fromError(String errorValue, int statusCode) {
    this.message = errorValue;
  }
}