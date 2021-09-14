import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:sparepart/dashboard/model/model.dart';
import 'package:sparepart/utils/instances.dart';
import '../../../main.dart';

class Count with ChangeNotifier {
  int priceCount = 0;
  Box<ProductModel> contactsBox = Hive.box<ProductModel>(productName);
  BuildContext _context;
  double total = 0.0;
  int prices = 0;
  int pri = 0;

  void init(BuildContext context) {
    this._context = context;
  }

  addingToCart({String image, String name, int price}) async {
    contactsBox.add(ProductModel(imgUrl: image, name: name, price: price));
    priceCount++;
    prices = price;
    total += prices;
    print('prices:$prices and price:$price');
    showToast(this._context, message: 'Successfully Added to Cart');
    notifyListeners();
  }

  incrementCount({double totalPrice}) {
    priceCount++;
    pri = prices * priceCount;
    totalPrice = double.parse(pri.toString());
    total = totalPrice;
    notifyListeners();
    return total;
  }

  decrementCount({double totalPrice}) {
    priceCount--;
    pri = prices * priceCount;
    totalPrice = double.parse(pri.toString());
    total = totalPrice;
    notifyListeners();
    return total;
  }

  deleteCard(int index) async {
    await contactsBox.delete(index);
    notifyListeners();
  }
}
