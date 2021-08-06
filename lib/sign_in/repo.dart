import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/api_result.dart';
import 'package:sparepart/utils/error_handler/handler.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';

class LoginApiRepository {
  Future<dynamic> loginUser({@required BuildContext context,@required Map map}) async {
    try {

      final _response =
      await networkClient.makePostRequest('login', data: map);
      final _finalData = SignInModel.fromJson(_response.data);
      print('printing first name ${_finalData.userData.firstName}');
      preferencesHelper.saveValue(key: 'firstname', value: _finalData.userData.firstName);
      preferencesHelper.saveValue(key: 'lastname', value: _finalData.userData.lastName);
      preferencesHelper.saveValue(key: 'email', value: _finalData.userData.email);
      preferencesHelper.saveValue(key: 'id', value: _finalData.userData.id);
      preferencesHelper.saveValue(key: 'profile_image', value: _finalData.userData.profileImage);
      preferencesHelper.saveValue(key: 'address', value: _finalData.userData.address);
      preferencesHelper.saveValue(key: 'phone', value: _finalData.userData.phoneNumber);
      return ApiResponse.success(
          statusMessage: _response.statusMessage,
          data: _finalData,
          statusCode: _response.statusCode);
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}