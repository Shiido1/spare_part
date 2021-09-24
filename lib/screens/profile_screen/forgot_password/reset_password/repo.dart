import 'package:flutter/material.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/reset_password/reset_password_screen.dart';
import 'package:sparepart/utils/error_handler/handler.dart';
import 'package:sparepart/utils/instances.dart';

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
    try {
      final _response =
          await networkClient.makePostRequest('reset-password', data: map);
      final _finalData = ResetPassword.fromJson(_response.data);

      return ApiResponse.success(
          statusMessage: _response.statusMessage,
          data: _finalData,
          statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}
