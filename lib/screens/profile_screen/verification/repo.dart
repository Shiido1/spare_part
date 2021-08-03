import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:sparepart/utils/error_handler/handler.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';

class OtpApiRepository {
  Future<dynamic> verify({@required String tokenMap}) async {
    final token = {
      'token': tokenMap
    };
    try {
      final response =
      await networkClient.makePostRequest("verify",
          data: token);
      final _finalData = OtpModel.fromJson(response.data);

      return ApiResponse.success(
          statusCode: response.statusCode,
          data: _finalData,
          statusMessage: response.statusMessage);
    } catch (e) {
      return handleNetworkException(e);
    }
  }

  Future<dynamic> resend({@required String queryToken}) async {
    final token = {
      'token': queryToken
    };
    try {
      final response = await networkClient.makePostRequest("verify",data: token);
      return ApiResponse.success(data: OtpModel.fromJson(response.data));
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}