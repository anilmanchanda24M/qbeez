class ResendOtpResponse{
  bool status;
  String message;
  String otp;

  ResendOtpResponse(this.status, this.message, this.otp);

  ResendOtpResponse.fromJson(Map<String, dynamic> json) {
    this.status = json['status'] == null ? null : json['status'];
    this.message = json['message'] == null ? null : json['message'];
    otp = json['otp'] == null ? null : json['otp'];
  }

  ResendOtpResponse.fromError(String errorValue, int statusCode) {
    this.message = errorValue;
  }
}