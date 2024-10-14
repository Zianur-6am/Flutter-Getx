import 'package:http/http.dart' as http;

import '../productmodule/models/product_model.dart';


class ApiService{
  //import 'package:http/http.dart' as http;
  static var client = http.Client();

  static Future<List<ProductModel>?> fetchProducts() async {
    var resoponse = await client.get(
      'https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie' as Uri
    );

    if(resoponse.statusCode == 200){
      var jsonString = resoponse.body;
      return productFromJson(jsonString);
    }

  }
}