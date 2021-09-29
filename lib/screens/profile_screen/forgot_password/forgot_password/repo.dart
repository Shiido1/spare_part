import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sparepart/screens/profile_screen/forgot_password/forgot_password/model.dart';
import 'package:sparepart/utils/instances.dart';

class ForgotPasswordRepository {
  Future<dynamic> forgotPassword({@required String email}) async {
    Map map = {'email': '$email'};
    try{
      print('inside forget');
      var url = Uri.parse('$BASE_URL' + 'forgot-password');
      var response = await http.post(url,body: map);
      var decodedData = json.decode(response.body);
      final _finalData = ForgotPassword.fromJson(decodedData);
      print('inside forgot ${_finalData.message}');
      return _finalData;

    }catch(e){
      return e;
    }
    // try {
    //   final _response =
    //       await networkClient.makePostRequest('forgot-password', data: map);
    //   final _finalData = ForgotPassword.fromJson(_response.data);
    //
    //   return ApiResponse.success(
    //       statusMessage: _response.statusMessage,
    //       data: _finalData,
    //       statusCode: _response.statusCode);
    // } catch (e) {
    //   return handleNetworkException(e);
    // }
  }
}
