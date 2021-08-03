
class SignUpModel {
  String message;

  SignUpModel({this.message});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  static Map<String, dynamic> toJson(
      {String phone,String firstName,String lastName,
        String email, String password,String address}) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = firstName;
    data['lname'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['address'] = address;
    return data;
  }
}