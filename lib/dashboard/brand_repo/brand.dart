import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';
import 'package:sparepart/dashboard/model/brand_model/brand_model.dart';

class BrandRepo{

  Brands brands;
  Future<dynamic> brandsRepo() async{
    String val = 'brands';

    try {
      List<Brands> brandsList = [];

      var url = Uri.parse('$BASE_URL'+'$val');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      List decodedData = jsonDecode(response.body);
      print('printing decoded stuff $decodedData');
      print('length ${decodedData.length}');
      for(int i = 0; i < decodedData.length;i++){
        brands = Brands(
          id: decodedData[i]['id'],
          imgUrl: decodedData[i]['img_url'],
          name: decodedData[i]['name'],
          description: decodedData[i]['description'],
          createdAt: decodedData[i]['createdAt'],
        );
        brandsList.add(brands);
      }
      return brandsList;
    } catch (e) {
      return e;
    }
  }
}