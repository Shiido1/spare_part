import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';

import 'model.dart';

class ResetPasswordRepository {
  Future<dynamic> resetPassword({
    @required String password,
    @required String confirmPassword,
    @required String otp}) async {
    Map map = {
      "pass": "$password",
      "pass2": "$confirmPassword",
      "token": "$otp"
    };

    try{
      print('inside reset');
      var url = Uri.parse('$BASE_URL' + 'reset-password');
      var response = await http.post(url,body: map);
      var decodedData = json.decode(response.body);
      final _finalData = ResetPassword.fromJson(decodedData);
      print('inside reset ${_finalData.message}');
      return _finalData;

    }catch(e){
      return e;
    }
  }
}
