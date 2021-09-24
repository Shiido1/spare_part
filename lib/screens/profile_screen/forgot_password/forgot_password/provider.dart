import 'package:flutter/material.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/forgot_password/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';
import 'package:sparepart/utils/page_route/route.dart';

ForgotPasswordRepository _forgotPasswordRepository = ForgotPasswordRepository();

class ForgotPasswordProvider extends ChangeNotifier {
  BuildContext _context;
  CustomLoader loader;
  String errorMsg = 'Try again';
  bool showLoader = false;

  void initialize(BuildContext context) {
    this.loader = CustomLoader(context);
    this._context = context;
  }

  void forgotPassword({@required String email}) async {
    try {
      // loader.showLoader();
      showLoader = true;
      final _response =
          await _forgotPasswordRepository.forgotPassword(email: email);
      _response.when(success: (success, _, statusMessage) async {
        // showToast(this._context, message: 'reset password');
        PageRouter.gotoNamed(Routes.RESETPASSWORD_SCREEN, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) async {
        if (error.toString() == 'NetworkExceptions.noInternetConnection()') {
          errorMsg = 'check internet connection and try again';
          // await loader.hideLoader();
          showLoader = false;
          showToast(this._context, message: errorMsg);
          notifyListeners();
        } else if (error.toString() ==
            'NetworkExceptions.unauthorizedRequest()') {
          errorMsg = 'check email and password and try again';
          showToast(this._context, message: errorMsg);
          notifyListeners();
        }
        showToast(this._context,
            message: NetworkExceptions.getErrorMessage(error));
        // await loader.hideLoader();
        showLoader = false;
        notifyListeners();
      });
    } catch (e) {
      // loader.hideLoader();
      showLoader = false;
      showToast(_context, message: e.toString());
      notifyListeners();
    }
  }
}
