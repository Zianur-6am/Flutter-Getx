import 'dart:convert';

import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/category_model.dart';
import 'package:flutter_getx/utils/app_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  static var client = http.Client();

  static Future<List<CategoriesModel>?> getCategory() async {
    List<CategoriesModel>? categoryList;
    var response = await client.get(
        Uri.parse('${AppContants.baseUrl}${AppContants.categoryUri}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        }

    );
    if(response.statusCode == 200){
      categoryList = [];
      // print('==========================================>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}');
      // print('-----------------(JSON DECODE)----${jsonDecode(response.body)}');
      
      // List<Map<String,dynamic>> jsonString = jsonDecode(response.body); //doesn't work

      List<dynamic> jsonString = jsonDecode(response.body);
      // dynamic jsonString = jsonDecode(response.body);

      jsonString.forEach((category){
        categoryList!.add(CategoriesModel.fromJson(category));
      });

      print('${categoryList}');
      
      return categoryList;
    }

    return null;

  }
}