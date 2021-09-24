import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/screens/product_screen/product_model_screen.dart';

class ProductRepo {
  Future<dynamic> product(String id) async {
    String val = 'product';
    Map map = {"id": "$id"};
    try {
      var url = Uri.parse('$BASE_URL' + '$val');
      var response = await http.post(url, body: map);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var decodedData = json.decode(response.body);
      dynamic mapList = decodedData['product'];
      GProductModel gProductModel = GProductModel(
          product: Product(
        name: mapList['name'],
        productCode: mapList['product_code'],
        imgUrl: mapList['img_url'],
        imgUrl1: mapList['img_url_1'],
        imgUrl2: mapList['img_url_2'],
        discount: mapList['discount'],
      ));
      return gProductModel;
    } catch (e) {
      return e;
    }
  }
}
