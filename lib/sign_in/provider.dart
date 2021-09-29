import 'package:flutter/cupertino.dart';
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
        loader.showLoader();
        model = await _loginRepository.loginUser(context: context, map: map);
        print('printing spare part model ${model.userData.firstName}');
        print('printing spare part model $model');
        print('printing stacode code ${model.message}');
        await loader.hideLoader();
        showToast(this._context, message: model.message);
        PageRouter.gotoNamed(Routes.DASHBOARD_SCREEN, _context);
        notifyListeners();
      } catch (e) {
        await loader.hideLoader();
        showToast(this._context, message: 'Failed.. Please try again');
        notifyListeners();
      }
  }
}
