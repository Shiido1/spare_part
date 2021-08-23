import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:sparepart/dashboard/model/model.dart';
import 'package:sparepart/utils/instances.dart';

import '../../../main.dart';

class Count with ChangeNotifier{
  int priceCount;
  int count=0;
  int mainPrice=0;
  int totalPrice=0;
  Box<ProductModel> contactsBox = Hive.box<ProductModel>(productName);
  BuildContext _context;

  void init(BuildContext context) {
    this._context = context;
  }

  addingToCart({String image,String name,int price}) async {
    showToast(this._context, message: 'Successfully Added to Cart');
    contactsBox.add(ProductModel(imgUrl: image, name: name, price: price));
    priceCount = 1;
    count++;
    mainPrice+=price;
    notifyListeners();
  }

  incrementCount(){
    priceCount++;
    print('printing increment count: $priceCount');
    notifyListeners();
  }

  decrementCount(){
    priceCount--;
    print('printing decrement count: $priceCount');
    notifyListeners();
  }

  Future<int> calculateTotalPrice() async {
    totalPrice=mainPrice * priceCount;
    print('printing total count: $totalPrice');
    notifyListeners();
    return totalPrice;
  }

  deleteCard(int index)async{
    await contactsBox.delete(index);
    count--;
    notifyListeners();
  }
}