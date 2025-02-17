import 'dart:convert';

import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/banner_model.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/category_model.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/food_campaign_model.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/models/popular_food_model.dart';
import 'package:flutter_getx/utils/app_constant.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  static var client = http.Client();

  ///category
  static Future<List<CategoriesModel>?> getCategory() async {
    List<CategoriesModel>? categoryList;
    var response = await client.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.categoryUri}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        });
    if (response.statusCode == 200) {
      categoryList = [];
      // print('==========================================>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}');
      // print('-----------------(JSON DECODE)----${jsonDecode(response.body)}');

      // List<Map<String,dynamic>> jsonString = jsonDecode(response.body); //doesn't work

      List<dynamic> jsonString = jsonDecode(response.body);
      // dynamic jsonString = jsonDecode(response.body);//works

      for (var category in jsonString) {
        categoryList.add(CategoriesModel.fromJson(category));
      }

      // print('${categoryList}');

      return categoryList;
    }

    return null;
  }

  ///campaign
  static Future<List<FoodCampaignModel>?> getFoodCampaign() async {
    List<FoodCampaignModel>? foodCampaignList;
    var response = await client.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.foodCampaignUri}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        });
    if (response.statusCode == 200) {
      foodCampaignList = [];
      // print('==========================================>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}');
      // print('-----------------(JSON DECODE)----${jsonDecode(response.body)}');

      // List<Map<String,dynamic>> jsonString = jsonDecode(response.body); //doesn't work

      List<dynamic> jsonString = jsonDecode(response.body);
      // dynamic jsonString = jsonDecode(response.body);

      for (var food in jsonString) {
        foodCampaignList.add(FoodCampaignModel.fromJson(food));
      }

      // print('${foodCampaignList}');

      return foodCampaignList;
    }

    return null;
  }

  ///popular food
  static Future<List<Products>?> getPopularFood() async {
    PopularFoodModel? popularFoodModel;
    var response = await client.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.popularProductUri}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        });
    if (response.statusCode == 200) {
      // print('==========================================>>>>>>>>>>>>>>>>>>>>>>>>>${response.body}');
      // print('-----------------(JSON DECODE)----${jsonDecode(response.body)}');

      dynamic jsonString = jsonDecode(response.body);
      // Map<String,dynamic> jsonString = jsonDecode(response.body);

      popularFoodModel = PopularFoodModel.fromJson(jsonString);

      // print('==========================================================>${popularFoodModel}');

      return popularFoodModel.products;
    }

    return null;
  }





  ///banner
  static Future<List<Banners>?> getBanner() async {
    BannerModel? bannerModel;
    var response = await client.get(
        Uri.parse('${AppConstants.baseUrl}${AppConstants.bannerUri}'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'zoneId': '[1]',
          'latitude': '23.735129',
          'longitude': '90.425614'
        });
    if (response.statusCode == 200) {
      dynamic jsonString = jsonDecode(response.body);

      bannerModel = BannerModel.fromJson(jsonString);

      // print('==========================================================>${bannerModel}');


      return bannerModel.banners;
    }

    return null;
  }
}
