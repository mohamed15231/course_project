/// code : 200
/// message : "done"
/// data : {"id":55,"first_name":"mohamed","last_name":"tarek","name":"mohamed tarek","email":"m@123.com","image":"http://alcaptin.com/dashboard/images/profile_default.png","phone":null,"active":null,"sms_code":"cFOt","date_of_birth":"20","gender":"male","access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9hbGNhcHRpbi5jb21cL2FwaVwvcmVnaXN0ZXIiLCJpYXQiOjE2NjM2Nzg0MzcsIm5iZiI6MTY2MzY3ODQzNywianRpIjoiOTRDSGRRdTN2R1VJTE1kZiIsInN1YiI6NTUsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.nuHRdSzUsJUyOB8UEyg1ltP5U8gNruYkOwz_yv89itM"}

class RegisterModel {
  num? code;
  String? message;
  Data? data;
  RegisterModel.fromJson(Map<String,dynamic> json){
    code=json['code'];
    message=json['message'];
    data= json['data']!=null ? Data.fromJson(json['data']) :null ;

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
  dynamic active;
  String? smsCode;
  String? dateOfBirth;
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