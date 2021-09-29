import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:sparepart/utils/error_handler/handler.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';

class SignUpApiRepository {
  Future<dynamic> signUp({@required Map map}) async {


    try {
      print('print');
      print('print map$map');
      final _response =
      await networkClient.makePostRequest('register', data: map);
      print('print ${_response.toString()}');
      final _finalData = SignUpModel.fromJson(_response.data);
      print('printing ${_finalData.message}');
      return ApiResponse.success(
          statusMessage: _response.statusMessage,
          data: _finalData,
          statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }

  }
}