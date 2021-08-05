import 'package:flutter/cupertino.dart';
import 'package:sparepart/dashboard/repo.dart';
import 'package:sparepart/utils/custom_loader/custom_loader_indicator.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';

TopProductRepo topProductRepo = TopProductRepo();
class TopProductProvider extends ChangeNotifier {
  BuildContext _context;
  CustomLoader _progressIndicator;
  List<ProductModel> productModel;

  void init(BuildContext context) {
    this._context = context;
    this._progressIndicator = CustomLoader(context);
  }

  void topProductProvider() async {
    try {
      // _progressIndicator.showLoader();
      productModel=await topProductRepo.topProductRepo();
      showToast(this._context, message: 'loaded');
      // _progressIndicator.hideLoader();
      notifyListeners();
    } catch (e) {
      // _progressIndicator.hideLoader();
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}