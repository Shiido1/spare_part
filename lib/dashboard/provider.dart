import 'package:flutter/cupertino.dart';
import 'package:sparepart/dashboard/repo.dart';
import 'package:sparepart/utils/instances.dart';
import 'model/category_model.dart';
import 'model/model.dart';

TopProductRepo topProductRepo = TopProductRepo();
FeaturedProductRepo featuredProductRepo = FeaturedProductRepo();
CategoriesRepo categoriesRepo = CategoriesRepo();

class TopProductProvider extends ChangeNotifier {
  BuildContext _context;
  List<ProductModel> productModel;
  List<ProductModel> items = [];

  ProductModel model;

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