import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/screens/product_screen/product_model_screen.dart';

class ProductRepo {
  Future<dynamic> product(String id) async {
    String val = 'product';
    Map map = {"id": "$id"};
    try {
      List<RecentProducts> recentProductList = [];
      var url = Uri.parse('$BASE_URL' + '$val');
      var response = await http.post(url, body: map);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var decodedData = json.decode(response.body);
      dynamic mapList = decodedData['product'];
      List mapRecentList = decodedData['recent_products'];
      GProductModel gProductModel = GProductModel(
          product: Product(
            name: mapList['name'],
            productCode: mapList['product_code'],
            imgUrl: mapList['img_url'],
            imgUrl1: mapList['img_url_1'],
            imgUrl2: mapList['img_url_2'],
            discount: mapList['discount'],
          ));
      for(int i = 0; i < mapRecentList.length; i++){
        RecentProducts recentProducts = RecentProducts(
          name: mapRecentList[i]['name'],
          description: mapRecentList[i]['description'],
          imgUrl: mapRecentList[i]['img_url'],
          imgUrl1: mapRecentList[i]['img_url_1'],
          imgUrl2: mapRecentList[i]['img_url_2'],
          discount: mapRecentList[i]['discount'],
          price: mapRecentList[i]['price'],
          category: mapRecentList[i]['category'],
          weightInKg: mapRecentList[i]['weight_in_kg'],
          year: mapRecentList[i]['year'],
          productCode: mapRecentList[i]['product_code'],
        );
        recentProductList.add(recentProducts);
        print('recemt produt list ${recentProducts.name}');
        print('recemt produt length ${mapRecentList.length}');
      }
      return gProductModel;
    } catch (e) {
      return e;
    }
  }
}
