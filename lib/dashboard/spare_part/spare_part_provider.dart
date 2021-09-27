import 'package:flutter/cupertino.dart';
import 'package:sparepart/dashboard/spare_part/spare_part_model.dart';
import 'package:sparepart/dashboard/spare_part/spare_part_repo.dart';
import 'package:sparepart/utils/instances.dart';

SparePartProductRepo sparePartProductRepo = SparePartProductRepo();

class SparePartProvider extends ChangeNotifier {
  SparePartModel sparePartModel;
  BuildContext _context;

  void init(BuildContext context) {
    this._context = context;
  }

  void sparePartProvider() async {
    try {
      sparePartModel = await sparePartProductRepo.sparePartProduct();
      print('printing spare part model ${sparePartModel.products.length}');
      notifyListeners();
    } catch (e) {
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}
