import 'dart:convert';

import 'package:sparepart/dashboard/model.dart';
import 'package:http/http.dart' as http;

class TopProductRepo{

  ProductModel product;
  Future<dynamic> topProductRepo() async{

    try {
      List<ProductModel> productList = [];

      var url = Uri.parse('https://admin.gapaautoparts.com/api/top-products');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      List decodedData = jsonDecode(response.body);
      print('printing decoded stuff $decodedData');
      print('length ${decodedData.length}');
      for(int i = 0; i < decodedData.length;i++){
         product = ProductModel(
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
            print('print pro duct $i ${product.name}');
      }
      return productList;
    } catch (e) {
      return e;
    }
    // print('1 ${decodedData[0]}');
    // print('1 name ${decodedData[0]['name']}');
    // print('1 description ${decodedData[0]['description']}');
    // print('2 ${decodedData[1]}');
    // print('2 name ${decodedData[1]['name']}');
    // print('3 ${decodedData[2]}');
    // print('3 name ${decodedData[2]['name']}');
    // print('4 ${decodedData[3]}');
    // print('4 name ${decodedData[3]['name']}');
    // print('5 ${decodedData[4]}');
    // print('5 name ${decodedData[4]['name']}');

    // List<ProductModel> productList = [];
    // try {
    //
    //   final response =
    //   await networkClient.makeGetRequest('top-products');
    //   print('print main response $response');
    //   String responseString = response.toString();
    //   print('print response $responseString');
    //   var decodedData = jsonDecode(jsonEncode(response.data));
    //   print("printing decodedData $decodedData");
    //   List<ProductModel> mapUser = decodedData;
    //   productList.clear();
    //   for (int i = 0; i < mapUser.length; i++) {
    //     ProductModel product = ProductModel(
    //       id: decodedData[i]['id'],
    //       name: decodedData[i]['name'],
    //       description: decodedData[i]['description'],
    //       imgUrl: decodedData[i]['img_url'],
    //       imgUrl1: decodedData[i]['img_url_1'],
    //       imgUrl2: decodedData[i]['img_url_2'],
    //       price: decodedData[i]['price'],
    //       discount: decodedData[i]['discount'],
    //       category: decodedData[i]['category'],
    //       carId: decodedData[i]['car_id'],
    //       available: decodedData[i]['available'],
    //       stock: decodedData[i]['stock'],
    //       weightInKg: decodedData[i]['weight_in_kg'],
    //       createdAt: decodedData[i]['createdAt'],
    //       updatedAt: decodedData[i]['updatedAt'],
    //     );
    //     productList.add(product);
    //     print('print pro duct ${product.name}');
    //   }
    //   return productList;
    // } catch (e) {
    //   return handleNetworkException(e);
    // }
  }
}