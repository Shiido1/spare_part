import 'package:flutter/material.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/forgot_password/model.dart';
import 'package:sparepart/utils/error_handler/handler.dart';
import 'package:sparepart/utils/instances.dart';

class ForgotPasswordRepository {
  Future<dynamic> forgotPassword({@required String email}) async {
    Map map = {'email': '$email'};
    try {
      final _response =
          await networkClient.makePostRequest('forgot-password', data: map);
      final _finalData = ForgotPassword.fromJson(_response.data);

      return ApiResponse.success(
          statusMessage: _response.statusMessage,
          data: _finalData,
          statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}
