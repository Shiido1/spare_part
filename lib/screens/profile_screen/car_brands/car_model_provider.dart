import 'package:flutter/cupertino.dart';
import 'package:sparepart/screens/profile_screen/car_brands/car_model.dart';
import 'package:sparepart/screens/profile_screen/car_brands/car_model_repo.dart';
import 'package:sparepart/utils/instances.dart';

CarModelRepo carModelRepo = CarModelRepo();
class CarModelProvider extends ChangeNotifier{
  BuildContext _context;
  CarModel carModel;


  void init(BuildContext context) {
    this._context = context;
  }

  void carModelPro({@required String id})async{
    try{
      carModel = await carModelRepo.carModelRepo(id: id);
      notifyListeners();
    }catch(e){
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}