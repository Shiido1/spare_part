import 'package:flutter/cupertino.dart';
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/dashboard/brand_repo/brand.dart';
import 'package:sparepart/dashboard/model/brand_model/brand_model.dart';

BrandRepo brandRepo = BrandRepo();
class BrandsProvider extends ChangeNotifier {
  BuildContext _context;
  List<Brands> brandsModel;

  void init(BuildContext context) {
    this._context = context;
  }

  void brandsProvider() async {
    try {
      brandsModel=await brandRepo.brandsRepo();
      notifyListeners();
    } catch (e) {
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}