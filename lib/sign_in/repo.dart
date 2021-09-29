import 'package:flutter/cupertino.dart';
import 'package:sparepart/utils/instances.dart';
import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginApiRepository {
  SignInModel signInModel;

  Future<dynamic> loginUser(
      {@required BuildContext context, @required Map map}) async {

    try{
      print('printing sign in $map');
      var url = Uri.parse('$BASE_URL'+'login');
      var response = await http.post(url,body:map);
      var decodedData = json.decode(response.body);
      var decode = decodedData['user_data'];
      print('printing sign in $response');
      print('printing sign in ${response.body}');
      print('printing sign in $decodedData}');
      signInModel = SignInModel(
        message: decodedData['message'],
        userData: UserData(
          id: decode['id'],
          email: decode['email'],
          firstName: decode['first_name'],
          lastName: decode['last_name'],
          phoneNumber: decode['phone_number'],
          state: decode['state'],
          profileImage: decode['profile_image'],
          address: decode['address'],
        ),
      );
        preferencesHelper.saveValue(
            key: 'first_name', value: signInModel.userData.firstName);
        preferencesHelper.saveValue(
            key: 'last_name', value: signInModel.userData.lastName);
        preferencesHelper.saveValue(
            key: 'email', value: signInModel.userData.email);
        preferencesHelper.saveValue(key: 'id', value: signInModel.userData.id);
        preferencesHelper.saveValue(
            key: 'profile_image', value: signInModel.userData.profileImage);
        preferencesHelper.saveValue(
            key: 'address', value: signInModel.userData.address);
        preferencesHelper.saveValue(
            key: 'phone', value: signInModel.userData.phoneNumber);
      return signInModel;
    }catch(e){
      return e;
    }
  }
}
