import 'dart:convert';
import 'package:sparepart/dashboard/model/model.dart';
import 'package:http/http.dart' as http;
import 'package:sparepart/utils/instances.dart';
import 'model/category_model.dart';

class TopProductRepo {
  ProductModel product;
  Future<dynamic> topProductRepo() async {
    String val = 'top-products';

    try {
      List<ProductModel> productList = [];

      var url = Uri.parse('$BASE_URL' + '$val');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      List decodedData = jsonDecode(response.body);
      print('printing decoded stuffi $decodedData');
      print('length ${decodedData.length}');
      for (int i = 0; i < decodedData.length; i++) {
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
          modelId: decodedData[i]['model_id'],
          makerId: decodedData[i]['maker_id'],
          brandId: decodedData[i]['brand_id'],
          year: decodedData[i]['year'],
        );
        productList.add(product);
        preferencesHelper.saveValue(key: 'discount', value: product.discount);
      }
      return productList;
    } catch (e) {
      return e;
    }
  }
}

class FeaturedProductRepo {
  ProductModel featuredProduct;
  Future<dynamic> featuredProductRepo() async {
    String val = 'featured-products';

    try {
      List<ProductModel> featuredProductList = [];

      var url = Uri.parse('$BASE_URL' + '$val');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      List decodedData = jsonDecode(response.body);
      print('printing decoded stuff $decodedData');
      print('length ${decodedData.length}');
      for (int i = 0; i < decodedData.length; i++) {
        featuredProduct = ProductModel(
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
          modelId: decodedData[i]['model_id'],
          makerId: decodedData[i]['maker_id'],
          brandId: decodedData[i]['brand_id'],
          year: decodedData[i]['year'],
        );
        featuredProductList.add(featuredProduct);
      }
      return featuredProductList;
    } catch (e) {
      return e;
    }
  }
}

class CategoriesRepo {
  Category categories;
  Future<dynamic> categoriesRepo() async {
    String val = 'categories';

    try {
      List<Category> categoriesList = [];

      var url = Uri.parse('$BASE_URL' + '$val');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      List decodedData = jsonDecode(response.body);
      print('printing decoded stuff $decodedData');
      print('length ${decodedData.length}');
      for (int i = 0; i < decodedData.length; i++) {
        categories = Category(
          id: decodedData[i]['id'],
          imgUrl: decodedData[i]['img_url'],
          title: decodedData[i]['title'],
          createdAt: decodedData[i]['createdAt'],
        );
        categoriesList.add(categories);
      }
      return categoriesList;
    } catch (e) {
      return e;
    }
  }
}
