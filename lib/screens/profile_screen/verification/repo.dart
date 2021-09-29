import 'package:flutter/cupertino.dart';
import 'package:sparepart/sign_up/model.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpApiRepository {
  SignUpModel signUpModel;

  Future<dynamic> verify({@required String tokenMap}) async {
    final token = {
      'token': tokenMap
    };

    try{
      print('inside verification');
      var url = Uri.parse('$BASE_URL' + 'verify');
      var response = await http.post(url,body: token);
      var decodedData = json.decode(response.body);
      final _finalData = OtpModel.fromJson(decodedData);
      print('inside verification ${_finalData.message}');
      return _finalData;

    }catch(e){
      return e;
    }
  }

  Future<dynamic> resend({@required String queryToken}) async {
    final token = {
      'token': queryToken
    };

    try{
      print('inside resend');
      var url = Uri.parse('$BASE_URL' + 'verify');
      var response = await http.post(url,body: token);
      var decodedData = json.decode(response.body);
      final _finalData = OtpModel.fromJson(decodedData);
      print('inside verification ${_finalData.message}');
      return _finalData;

    }catch(e){
      return e;
    }
  }
}