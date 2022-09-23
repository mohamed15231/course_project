
class LoginModel {

  num? code;
  String? message;
  Data? data;
  LoginModel.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }


}



class Data {
  num? id;
  String? firstName;
  String? lastName;
  String? name;
  String? email;
  String? image;
  dynamic phone;
  num? active;
  String? smsCode;
  dynamic dateOfBirth;
  String? gender;
  String? accessToken;

  Data.fromJson(dynamic json) {
  id = json['id'];
  firstName = json['first_name'];
  lastName = json['last_name'];
  name = json['name'];
  email = json['email'];
  image = json['image'];
  phone = json['phone'];
  active = json['active'];
  smsCode = json['sms_code'];
  dateOfBirth = json['date_of_birth'];
  gender = json['gender'];
  accessToken = json['access_token'];
  }



}