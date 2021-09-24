import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sparepart/dashboard/model/brand_model/brand_model_class.dart';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';

class BrandIdRepo {
  // BrandModel brandModel;
  Cars cars;
  Future<dynamic> brandIdRepo({@required String id}) async {
    try {
      List<Cars> carsList = [];

      var url = Uri.parse('$BRAND_BASE_URL' + '$id');
      var response = await http.get(url);
      print('printing brand id url $url');
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      var decodedData = jsonDecode(response.body);
      dynamic mapList = decodedData['cars'];
      print('printing decoded stuff $decodedData');
      print('printing decoded stuff $mapList');
      print('length ${decodedData.length}');
      print('mapList length ${mapList.length}');
      for (int i = 0; i < mapList.length; i++) {
        cars = Cars(
            id: mapList[i]['id'],
            imgUrl: mapList[i]['img_url'],
            name: mapList[i]['name'],
            vin: mapList[i]['vin'],
            brandId: mapList[i]['brand_id'],
            createdAt: mapList[i]['createdAt'],
            updatedAt: mapList[i]['updatedAt']);
        carsList.add(cars);
      }
      return carsList;
    } catch (e) {
      return e;
    }
  }
}
