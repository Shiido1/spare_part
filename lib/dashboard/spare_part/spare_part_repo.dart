import 'package:sparepart/dashboard/spare_part/spare_part_model.dart';
import 'package:sparepart/utils/instances.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SparePartProductRepo {
  Future<dynamic> sparePartProduct() async {
    String val = 'products';
    try {
      List<Products> productList = [];
      var url = Uri.parse('$BASE_URL' + '$val');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var decodedData = json.decode(response.body);
      List<dynamic> mapList = decodedData['products'];
      for (int i = 0; i < mapList.length; i++) {
        Products products = Products(
          id: mapList[i]['id'],
          name: mapList[i]['name'],
          description: mapList[i]['description'],
          imgUrl: mapList[i]['img_url'],
          imgUrl1: mapList[i]['img_url_1'],
          imgUrl2: mapList[i]['img_url_2'],
          discount: mapList[i]['discount'],
          price: mapList[i]['price'],
          category: mapList[i]['category'],
          weightInKg: mapList[i]['weight_in_kg'],
          year: mapList[i]['year'],
          productCode: mapList[i]['product_code'],
        );
        productList.add(products);
        print('recemt produt list ${products.name}');
        print('recemt produt length ${productList.length}');
      }
      SparePartModel sparePartModel = SparePartModel(products: productList);
      return sparePartModel;
    } catch (e) {
      return e;
    }
  }
}
