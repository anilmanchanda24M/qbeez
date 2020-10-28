import 'dart:ffi';

class User {
  int id, user_type;
  String name, mobile, email, verification_code, country_code, access_token;

  User(
      {this.id, this. user_type, this.name, this.mobile, this.email,
        this.verification_code, this.country_code, this.access_token});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] == 0 ? 0 : json['id'];
    user_type = json['user_type'] == 0 ? 0 : json['user_type'];
    email = json['email'] == null ? null : json['email'];
    name = json['name'] == null ? null : json['name'];
    mobile = json['mobile'] == null ? null : json['mobile'];
    verification_code = json['verification_code'] == null ? null : json['verification_code'];
    country_code = json['country_code'] == null ? null : json['country_code'];
    access_token = json['access_token'] == null ? null : json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == 0 ? 0 : id;
    data['user_type'] = this.user_type == 0 ? 0 : user_type;
    data['email'] = this.email == null ? null : email;
    data['mobile'] = this.mobile == null ? null : mobile;
    data['name'] = this.name == null ? null : name;
    data['verification_code'] = this.verification_code == null ? null : verification_code;
    data['country_code'] = this.country_code == null ? null : country_code;
    data['access_token'] = this.access_token == null ? null : access_token;
    return data;
  }
}

class WalletData{
  int id, user_id, user_type;
  String wallet_type, open_balance;

  WalletData(
      {this.id, this. user_type, this.user_id, this.wallet_type,
        this.open_balance});

  WalletData.fromJson(Map<String, dynamic> json) {
    id = json['id'] == 0 ? 0 : json['id'];
    user_type = json['user_type'] == 0 ? 0 : json['user_type'];
    user_id = json['user_id'] == 0 ? 0 : json['user_id'];
    wallet_type = json['wallet_type'] == 0 ? 0 : json['wallet_type'];
    open_balance = json['open_balance'] == 0.00 ? 0.00 : json['open_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id == 0 ? 0 : id;
    data['user_type'] = this.user_type == 0 ? 0 : user_type;
    data['user_id'] = this.user_id == 0 ? 0 : user_id;
    data['wallet_type'] = this.wallet_type == 0 ? 0 : wallet_type;
    data['open_balance'] = this.open_balance == 0.00 ? 0.00 : open_balance;
    return data;
  }
}