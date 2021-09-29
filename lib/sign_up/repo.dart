import 'package:flutter/cupertino.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpApiRepository {
  Future<dynamic> signUp({@required Map map}) async {

    print('printer sign up');

    try{
      print('inside signup');
      var url = Uri.parse('$BASE_URL' + 'register');
      var response = await http.post(url,body: map);
      var decodedData = json.decode(response.body);
      final finalData = SignUpModel.fromJson(decodedData);
      print('inside sign up');
      print('inside sign up ${finalData.message}');
      return finalData;

    }catch(e){
      return e;
    }

  }
}