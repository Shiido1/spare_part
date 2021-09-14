import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sparepart/sign_in/model.dart';
import 'package:sparepart/sign_in/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';
import 'package:sparepart/utils/page_route/route.dart';

LoginApiRepository _loginRepository = LoginApiRepository();

class SignInProvider extends ChangeNotifier {
  BuildContext _context;
  CustomLoader loader;
  String errorMsg = 'Login Failed,try again';
  SignInModel model;
  bool showLoader = false;

  void initialize(BuildContext context) {
    this.loader = CustomLoader(context);
    this._context = context;
  }

  void loginUser({@required BuildContext context, @required Map map}) async {
    try {
      // loader.showLoader();
      showLoader = true;
      final _response =
          await _loginRepository.loginUser(context: context, map: map);
      _response.when(success: (success, _, statusMessage) async {
        showToast(this._context, message: 'Login Successful.');
        // await loader.hideLoader();
        showLoader = false;
        PageRouter.gotoNamed(Routes.DASHBOARD_SCREEN, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, _, statusMessage) async {
        // await loader.hideLoader();
        showLoader = false;
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
