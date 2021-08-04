import 'package:flutter/cupertino.dart';
import 'package:sparepart/dashboard/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';

TopProductRepo topProductRepo = TopProductRepo();
class TopProductProvider extends ChangeNotifier {
  BuildContext _context;
  CustomLoader _progressIndicator;
  ProductModel productModel;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomLoader(this._context);
  }

  void topProductProvider() async {
    try {
      _progressIndicator.showLoader();
      await topProductRepo.topProductRepo();
      await _progressIndicator.hideLoader();
      notifyListeners();
    } catch (e) {
      await _progressIndicator.hideLoader();
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}