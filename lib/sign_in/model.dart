import 'package:flutter/cupertino.dart';

class SignInModel {
  String message;
  String token;
  UserData userData;

  SignInModel({this.message, this.token, this.userData});

  SignInModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['token'] = this.token;
    if (this.userData != null) {
      data['user_data'] = this.userData.toJson();
    }
    return data;
  }

  static Map<String, dynamic> toSignInJson(
      {@required String email, @required String password}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email_or_phone'] = email;
    data['password'] = password;
    return data;
  }
}

class UserData {
  String id;
  String firstName;
  String lastName;
  String profileImage;
  String phoneNumber;
  String state;
  String address;
  String email;

  UserData(
      {this.id,
        this.firstName,
        this.lastName,
        this.profileImage,
        this.phoneNumber,
        this.state,
        this.address,
        this.email});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    phoneNumber = json['phone_number'];
    state = json['state'];
    address = json['address'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['phone_number'] = this.phoneNumber;
    data['state'] = this.state;
    data['address'] = this.address;
    data['email'] = this.email;
    return data;
  }
}
