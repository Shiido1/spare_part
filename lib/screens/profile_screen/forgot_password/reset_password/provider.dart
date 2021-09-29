import 'package:flutter/material.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/reset_password/model.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/reset_password/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';
import 'package:sparepart/utils/page_route/route.dart';

ResetPasswordRepository _resetPasswordRepository = ResetPasswordRepository();

class ResetPasswordProvider extends ChangeNotifier {
  BuildContext _context;
  CustomLoader loader;
  ResetPassword model;
  bool showLoader = false;

  void initialize(BuildContext context) {
    this.loader = CustomLoader(context);
    this._context = context;
  }

  void resetPassword({@required String password,@required String confirmPassword,@required String otp}) async {
    try {
      loader.showLoader();
      model = await _resetPasswordRepository.resetPassword(password: password, confirmPassword: confirmPassword, otp: otp);
      print('printing spare part model ${model.message}');
      await loader.hideLoader();
      showToast(this._context, message: model.message);
      PageRouter.gotoNamed(Routes.DASHBOARD_SCREEN, _context);
      notifyListeners();
    } catch (e) {
      await loader.hideLoader();
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
    // try {
    //   loader.showLoader();
    //   final _response =
    //       await _resetPasswordRepository.resetPassword(
    //           confirmPassword: confirmPassword, password: password, otp: otp);
    //   _response.when(success: (success, _, statusMessage) async {
    //     showToast(this._context, message: 'reset password');
    //     PageRouter.gotoNamed(Routes.DASHBOARD_SCREEN, _context);
    //     notifyListeners();
    //   }, failure: (NetworkExceptions error, _, statusMessage) async {
    //     if (error.toString() == 'NetworkExceptions.noInternetConnection()') {
    //       errorMsg = 'check internet connection and try again';
    //       // await loader.hideLoader();
    //       showLoader = false;
    //       showToast(this._context, message: errorMsg);
    //       notifyListeners();
    //     } else if (error.toString() ==
    //         'NetworkExceptions.unauthorizedRequest()') {
    //       errorMsg = 'check email and password and try again';
    //       showToast(this._context, message: errorMsg);
    //       notifyListeners();
    //     }
    //     showToast(this._context,
    //         message: NetworkExceptions.getErrorMessage(error));
    //     // await loader.hideLoader();
    //     showLoader = false;
    //     notifyListeners();
    //   });
    // } catch (e) {
    //   // loader.hideLoader();
    //   showLoader = false;
    //   showToast(_context, message: e.toString());
    //   notifyListeners();
    // }
  }
}
