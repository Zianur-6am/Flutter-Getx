import 'dart:convert';

import 'package:flutter_getx/features/home/models/category_model.dart';
import 'package:flutter_getx/utils/app_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  static var client = http.Client();

  static Future<String?> getCategory() async {
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

      print('==========================================>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}');
      print('-----------------(JSON DECODE)----${jsonDecode(response.body)}');
      var jsonString = response.body;
      return jsonString;
    }

  }
}