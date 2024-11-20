import 'package:http/http.dart' as http;

import '../productmodule/models/product_model.dart';


class ApiService{
  //import 'package:http/http.dart' as http;
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'),
    );
    if(response.statusCode == 200){
      var jsonString = response.body;
      return productFromJson(jsonString);
    }
    return null;

  }

  static Future<List<ProductModel>?> getCategory() async {
    var response = await client.get(
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        }

    );
    if(response.statusCode == 200){
      var jsonString = response.body;
      return productFromJson(jsonString);
    }
    return null;

  }
}