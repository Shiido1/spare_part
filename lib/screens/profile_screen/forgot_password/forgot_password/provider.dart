import 'package:flutter/material.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/forgot_password/model.dart';
import 'package:sparepart/screens/profile_screen/forgot_password/forgot_password/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';
import 'package:sparepart/utils/page_route/route.dart';

ForgotPasswordRepository _forgotPasswordRepository = ForgotPasswordRepository();

class ForgotPasswordProvider extends ChangeNotifier {
  BuildContext _context;
  CustomLoader loader;
  ForgotPassword model;
  bool showLoader = false;

  void initialize(BuildContext context) {
    this.loader = CustomLoader(context);
    this._context = context;
  }

  void forgotPassword({@required String email}) async {

    try {
      loader.showLoader();
      model = await _forgotPasswordRepository.forgotPassword(email: email);
      print('printing spare part model ${model.message}');
      await loader.hideLoader();
      showToast(this._context, message: model.message);
      PageRouter.gotoNamed(Routes.RESETPASSWORD_SCREEN, _context);
      notifyListeners();
    } catch (e) {
      await loader.hideLoader();
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}
