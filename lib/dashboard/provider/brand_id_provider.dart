import 'package:flutter/cupertino.dart';
import 'package:sparepart/dashboard/brand_repo/brand_id.dart';
import 'package:sparepart/dashboard/model/brand_model/brand_model_class.dart';
import 'package:sparepart/utils/instances.dart';

BrandIdRepo brandIdRepo = BrandIdRepo();
class BrandIdProvider extends ChangeNotifier {
  BuildContext _context;
  List<Cars> carsModel;

  void init(BuildContext context) {
    this._context = context;
  }

  void brandsProvider({@required String id}) async {
    try {
      carsModel=await brandIdRepo.brandIdRepo(id: id);
      notifyListeners();
    } catch (e) {
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}