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
      dynamic mapList1 = decodedData['product']['maker'];
      dynamic mapList2 = decodedData['product']['model'];
      dynamic mapList3 = decodedData['product']['model']['car'];
      List mapRecentList = decodedData['recent_products'];
      for (int i = 0; i < mapRecentList.length; i++) {
        RecentProducts recentProducts = RecentProducts(
          id: mapRecentList[i]['id'],
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
      GProductModel gProductModel = GProductModel(
          product: Product(
            id: mapList['id'],
            name: mapList['name'],
            productCode: mapList['product_code'],
            imgUrl: mapList['img_url'],
            imgUrl1: mapList['img_url_1'],
            imgUrl2: mapList['img_url_2'],
            discount: mapList['discount'],
            description: mapList['description'],
            year: mapList['year'],
            weightInKg: mapList['weightInKg'],
            maker: Maker(id: mapList1['id'], name: mapList1['name']),
            model: Model(
                id: mapList2['id'],
                name: mapList2['name'],
                car: Car(name: mapList3['name'])),
          ),
          recentProducts: recentProductList);
      return gProductModel;
    } catch (e) {
      return e;
    }
  }
}
