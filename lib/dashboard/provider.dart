import 'package:flutter/cupertino.dart';
import 'package:sparepart/dashboard/repo.dart';
import 'package:sparepart/utils/instances.dart';

import 'model.dart';

TopProductRepo topProductRepo = TopProductRepo();
FeaturedProductRepo featuredProductRepo = FeaturedProductRepo();
BrandRepo brandRepo = BrandRepo();
CategoriesRepo categoriesRepo = CategoriesRepo();

class TopProductProvider extends ChangeNotifier {
  BuildContext _context;
  List<ProductModel> productModel;
  List<ProductModel> items = [];

  ProductModel model;
  double price=0.0;
  bool isAdded = false;

  void add(ProductModel item){
    items.add(item);
    price+=item.price;
    if (items.length>1){
      isAdded = true;
      print('addes');
      notifyListeners();
    }else{
      isAdded = false;
    }
    notifyListeners();
  }

  int get count{
    return items.length;
  }

  double get totalPrice{
    return price;
  }

  void init(BuildContext context) {
    this._context = context;
  }

  void topProductProvider() async {
    try {
      productModel=await topProductRepo.topProductRepo();
      // showToast(this._context, message: 'loaded');
      notifyListeners();
    } catch (e) {
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}
class FeaturedProductProvider extends ChangeNotifier {
  BuildContext _context;
  List<ProductModel> featuredProductModel;

  void init(BuildContext context) {
    this._context = context;
  }

  void featuredProductProvider() async {
    try {
      featuredProductModel=await featuredProductRepo.featuredProductRepo();
      notifyListeners();
    } catch (e) {
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}
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
class CategoriesProvider extends ChangeNotifier {
  BuildContext _context;
  List<Category> categoriesModel;

  void init(BuildContext context) {
    this._context = context;
  }

  void categoriesProvider() async {
    try {
      categoriesModel=await categoriesRepo.categoriesRepo();
      notifyListeners();
    } catch (e) {
      showToast(this._context, message: 'Failed.. Please try again');
      notifyListeners();
    }
  }
}