import 'dart:convert';

import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/category_model.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/food_campaign_model.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/popular_food_model.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/widgets/popular_food_nearby.dart';
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
      // dynamic jsonString = jsonDecode(response.body);//works

      jsonString.forEach((category){
        categoryList!.add(CategoriesModel.fromJson(category));
      });

      // print('${categoryList}');
      
      return categoryList;
    }

    return null;

  }


  static Future<List<FoodCampaignModel>?> getFoodCampaign() async {
    List<FoodCampaignModel>? foodCampaignList;
    var response = await client.get(
        Uri.parse('${AppContants.baseUrl}${AppContants.foodCampaignUri}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        }

    );
    if(response.statusCode == 200){
      foodCampaignList = [];
      // print('==========================================>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}');
      // print('-----------------(JSON DECODE)----${jsonDecode(response.body)}');

      // List<Map<String,dynamic>> jsonString = jsonDecode(response.body); //doesn't work

      List<dynamic> jsonString = jsonDecode(response.body);
      // dynamic jsonString = jsonDecode(response.body);

      jsonString.forEach((food){
        foodCampaignList!.add(FoodCampaignModel.fromJson(food));
      });

      // print('${foodCampaignList}');

      return foodCampaignList;
    }

    return null;

  }


  static Future<List<Products>?> getPopularFood() async {
    PopularFoodModel? popularFoodModel;
    var response = await client.get(
        Uri.parse('${AppContants.baseUrl}${AppContants.popularProductUri}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        }

    );
    if(response.statusCode == 200){
      // print('==========================================>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}');
      // print('-----------------(JSON DECODE)----${jsonDecode(response.body)}');


      dynamic jsonString = jsonDecode(response.body);
      // Map<String,dynamic> jsonString = jsonDecode(response.body);



      popularFoodModel = PopularFoodModel.fromJson(jsonString);

      print('==========================================================>${popularFoodModel}');

      return popularFoodModel.products;
    }

    return null;

  }
}