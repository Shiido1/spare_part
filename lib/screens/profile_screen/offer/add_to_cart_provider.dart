import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:sparepart/dashboard/model/model.dart';
import 'package:sparepart/utils/instances.dart';
import '../../../main.dart';

class Count with ChangeNotifier {
  int priceCount=0;
  Box<ProductModel> contactsBox = Hive.box<ProductModel>(productName);
  BuildContext _context;
  var totalPrice;

  void init(BuildContext context) {
    this._context = context;
  }

  addingToCart({String image, String name, int price}) async {
    contactsBox.add(ProductModel(imgUrl: image, name: name, price: price));
    priceCount++;
    totalPrice=double.parse(price.toString());
    showToast(this._context, message: 'Successfully Added to Cart');
    notifyListeners();
  }

  incrementCount() {
    priceCount++;
    totalPrice=totalPrice * priceCount;
    notifyListeners();
    return totalPrice;
  }

  decrementCount() {
    totalPrice=totalPrice / priceCount;
    priceCount--;
    notifyListeners();
    return totalPrice;
  }

  deleteCard(int index) async {
    await contactsBox.delete(index);
    notifyListeners();
  }

  Future<int> calculateTotalPrice() async {
    // totalPrice=mainPrice * priceCount;
    print('printing total count: $totalPrice');
    notifyListeners();
    return totalPrice;
  }
}
