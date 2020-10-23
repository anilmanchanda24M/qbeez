class User {
  int user_id, role_id;
  String name, phone_number, email, gender, dob, experience, hospital_address, country_id, nationality_id;
  String state_id, city_id, address_1, address_2, locality, height, weight, land_mark;
  String availability_for_home_visit, profile_image, cover_profile_image, pass_civil_number, accessToken;

  User(
      {this.user_id, this. role_id, this.name, this.phone_number, this.email,
        this.gender, this.dob, this.experience, this.hospital_address, this.country_id,
        this.nationality_id, this.state_id, this.city_id, this.address_1, this.address_2,
        this.locality, this.height, this.weight, this.land_mark, this.availability_for_home_visit,
        this.profile_image, this.cover_profile_image, this.pass_civil_number, this.accessToken});

  User.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'] == null ? null : json['user_id'];
    role_id = json['role_id'] == null ? null : json['role_id'];
    email = json['email'] == null ? null : json['email'];
    phone_number = json['phone_number'] == null ? null : json['phone_number'];
    name = json['name'] == null ? null : json['name'];
    gender = json['gender'] == null ? null : json['gender'];
    dob = json['dob'] == null ? null : json['dob'];
    experience = json['experience'] == null ? null : json['experience'];
    hospital_address = json['hospital_address'] == null ? null : json['hospital_address'];
    country_id = json['country'] == null ? null : json['country'];
    nationality_id = json['name'] == null ? null : json['nationality_id'];
    state_id = json['state'] == null ? null : json['state'];
    city_id = json['city'] == null ? null : json['city'];
    address_1 = json['address_1'] == null ? null : json['address_1'];
    address_2 = json['address_2'] == null ? null : json['address_2'];
    locality = json['locality'] == null ? null : json['locality'];
    height = json['height'] == null ? null : json['height'];
    weight = json['weight'] == null ? null : json['weight'];
    land_mark = json['land_mark'] == null ? null : json['land_mark'];
    availability_for_home_visit = json['availability_for_home_visit'] == null ? null : json['availability_for_home_visit'];
    profile_image = json['profile_image'] == null ? null : json['profile_image'];
    cover_profile_image = json['cover_profile_image'] == null ? null : json['cover_profile_image'];
    pass_civil_number = json['pass_civil_number'] == null ? null : json['pass_civil_number'];
    accessToken = json['accessToken'] == null ? null : json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id == null ? null : user_id;
    data['role_id'] = this.role_id == null ? null : role_id;
    data['email'] = this.email == null ? null : email;
    data['phone_number'] = this.phone_number == null ? null : phone_number;
    data['name'] = this.name == null ? null : name;
    data['gender'] = this.gender == null ? null : gender;
    data['dob'] = this.dob == null ? null : dob;
    data['experience'] = this.experience == null ? null : experience;
    data['hospital_address'] = this.hospital_address == null ? null : hospital_address;
    data['country_id'] = this.country_id == null ? null : country_id;
    data['nationality_id'] = this.nationality_id == null ? null : nationality_id;
    data['state_id'] = this.state_id == null ? null : state_id;
    data['city_id'] = this.city_id == null ? null : city_id;
    data['address_1'] = this.address_1 == null ? null : address_1;
    data['address_2'] = this.address_2 == null ? null : address_2;
    data['locality'] = this.locality == null ? null : locality;
    data['height'] = this.height == null ? null : height;
    data['weight'] = this.weight == null ? null : weight;
    data['land_mark'] = this.land_mark == null ? null : land_mark;
    data['availability_for_home_visit'] = this.availability_for_home_visit == null ? null : availability_for_home_visit;
    data['profile_image'] = this.profile_image == null ? null : profile_image;
    data['cover_profile_image'] = this.cover_profile_image == null ? null : cover_profile_image;
    data['pass_civil_number'] = this.pass_civil_number == null ? null : pass_civil_number;
    data['accessToken'] = this.accessToken == null ? null : accessToken;
    return data;
  }
}