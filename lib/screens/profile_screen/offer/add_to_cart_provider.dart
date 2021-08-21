import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:sparepart/dashboard/model/model.dart';

class Count with ChangeNotifier{

  int priceCount;
  int count=0;
  int mainPrice=0;
  int totalPrice;
  bool isAdded=false;
  Box<ProductModel> contactsBox = Hive.box<ProductModel>('hv_box');

  // init(){
  //   count = 0 ;
  //   mainPrice =
  // }

  addingToCart({String image,String name,int price}){

    contactsBox.add(ProductModel(imgUrl: image, name: name, price: price))
        .then((value) =>
        print('Added successfully'));
    isAdded = true;
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

  int calculateTotalPrice(){
    totalPrice+=mainPrice * priceCount;
    print('printing total count: $totalPrice');
    notifyListeners();
    return totalPrice;
  }

  deleteCard(int index)async{
    await contactsBox.delete(index);
    isAdded=false;
    count--;
    notifyListeners();
  }
}