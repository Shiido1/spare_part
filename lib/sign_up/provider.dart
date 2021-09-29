import 'package:flutter/cupertino.dart';
import 'package:sparepart/sign_up/model.dart';
import 'package:sparepart/sign_up/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/utils/page_route/navigator.dart';

final SignUpApiRepository _repository = SignUpApiRepository();

class SignUpProviders extends ChangeNotifier {
  BuildContext _context;
  CustomLoader loader;
 SignUpModel signUpModel;

  void init(BuildContext context) {
    this._context = context;
    this.loader = CustomLoader(_context);  }

  void signUp({@required Map map}) async {
    try {
      loader.showLoader();
      signUpModel = await _repository.signUp(map: map);
      print('printing sigup mofdel ${signUpModel.message}');
      await loader.hideLoader();
      showToast(this._context, message: signUpModel.message);
      PageRouter.gotoNamed(Routes.OTP, _context);
      notifyListeners();
    } catch (e) {
      await loader.hideLoader();
      showToast(this._context, message: signUpModel.message);
      notifyListeners();
    }
  }
}