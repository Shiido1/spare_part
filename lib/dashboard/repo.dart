import 'dart:convert';

import 'package:sparepart/dashboard/model.dart';
import 'package:sparepart/utils/error_handler/handler.dart';
import 'package:sparepart/utils/instances.dart';

class TopProductRepo{
  Future<dynamic> topProductRepo() async{

    List<ProductModel> productList = [];
    try {

      final response =
      await networkClient.makeGetRequest('top-products');
      print('print main response $response');
      String responseString = response.toString();
      print('print response $responseString');
      var decodedData = jsonDecode(jsonEncode(responseString));
      print("printing decodedData $decodedData");
      // List<dynamic> decodedData = decodedData;
      productList.clear();
      for (int i = 0; i < decodedData.length; i++) {
        ProductModel product = ProductModel(
          id: decodedData[i]['id'],
          name: decodedData[i]['name'],
          description: decodedData[i]['description'],
          imgUrl: decodedData[i]['img_url'],
          imgUrl1: decodedData[i]['img_url_1'],
          imgUrl2: decodedData[i]['img_url_2'],
          price: decodedData[i]['price'],
          discount: decodedData[i]['discount'],
          category: decodedData[i]['category'],
          carId: decodedData[i]['car_id'],
          available: decodedData[i]['available'],
          stock: decodedData[i]['stock'],
          weightInKg: decodedData[i]['weight_in_kg'],
          createdAt: decodedData[i]['createdAt'],
          updatedAt: decodedData[i]['updatedAt'],
        );
        productList.add(product);
        print('print pro duct ${product.name}');
      }
      return productList;
    } catch (e) {
      return handleNetworkException(e);
    }
  }
}