import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';
import 'car_model.dart';

class CarModelRepo{
  CarModel carModel;
  Future<dynamic> carModelRepo({@required String id})async{
    try{
      List<Models> modelList = [];

      var url = Uri.parse('$BRAND_BASE_URL' + '$id');
      var response = await http.get(url);
      var decodedData = jsonDecode(response.body);
      var value = decodedData['car'];
      dynamic mapList = decodedData['models'];
      for(int i =0; i< mapList.length;i++){
          Models model= Models(
              id: mapList[i]['id'],
              imgUrl: mapList[i]['img_url'],
              name: mapList[i]['name'],
              createdAt: mapList[i]['createdAt'],
              updatedAt: mapList[i]['updatedAt'],
              year: mapList[i]['year'],
          );
          modelList.add(model);
      }
      CarModel carModel = CarModel(
        car: Car(
            id: value['id'],
            imgUrl: value['img_url'],
            name: value['name'],
            vin: value['vin'],
            brandId: value['brand_id'],
            createdAt:value['createdAt'],
            updatedAt: value['updatedAt']
        ),
        models: modelList
      );
      return carModel;
    }catch(e){
      return e;
    }
  }
}