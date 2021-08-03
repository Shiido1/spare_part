import 'package:flutter/cupertino.dart';
import 'package:jaynetwork/network/network_exceptions.dart';
import 'package:sparepart/sign_up/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';

final SignUpApiRepository _repository = SignUpApiRepository();

class SignUpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomLoader loader;
  String errorMsg = 'Sign Up failed, try again';

  void init(BuildContext context) {
    this._context = context;
    this.loader = CustomLoader(_context);  }

  void signUp({@required Map map}) async {
    try {
      loader.showLoader();
      final _response = await _repository.signUp(map: map);
      _response.when(success: (success, _, message) async {
        await loader.hideLoader();
        showToast(this._context, message: 'SignUp Successful.');
        PageRouter.gotoNamed(Routes.OTP, _context);
        notifyListeners();
      }, failure: (NetworkExceptions error, int statusCode,
          String statusMessage) async {
        await loader.hideLoader();
        if(error.toString()=='NetworkExceptions.noInternetConnection()'){
          errorMsg = 'check internet connection and try again';
          showToast(this._context, message: errorMsg);
          notifyListeners();
        }else{
          showToast(this._context,
              message: NetworkExceptions.getErrorMessage(error));
          await loader.hideLoader();
          notifyListeners();
        }
      });
    } catch (e) {
      await loader.hideLoader().then((value) => showToast(
          this._context, message: 'Sign Up failed'));
      notifyListeners();
    }
  }
}