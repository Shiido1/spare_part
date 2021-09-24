import 'package:flutter/cupertino.dart';
import 'package:sparepart/screens/product_screen/product_model_screen.dart';
import 'package:sparepart/screens/product_screen/repo.dart';
import 'package:sparepart/utils/instances.dart';


ProductRepo productRepo = ProductRepo();
class ProductProvider extends ChangeNotifier{
  BuildContext _context;
  GProductModel gProductModel;

  void init(BuildContext context) {
    this._context = context;
  }
  void productProvider(String id) async {
    try {
      gProductModel=await productRepo.product(id);
      notifyListeners();
    } catch (e) {
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}