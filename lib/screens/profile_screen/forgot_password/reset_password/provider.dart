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
      PageRouter.gotoNamed(Routes.LOGIN, _context);
      notifyListeners();
    } catch (e) {
      await loader.hideLoader();
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}
