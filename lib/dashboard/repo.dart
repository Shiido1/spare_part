import 'dart:convert';
import 'package:sparepart/dashboard/model.dart';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';

class TopProductRepo{

  ProductModel product;
  Future<dynamic> topProductRepo() async{
    String val = 'top-products';

    try {
      List<ProductModel> productList = [];

      var url = Uri.parse('$BASE_URL'+'$val');
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
            print('print pro duct $i ${product.imgUrl}');
      }
      return productList;
    } catch (e) {
      return e;
    }
  }
}