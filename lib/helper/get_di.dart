
import 'package:flutter_getx/data/api/api_client.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/controllers/valley_home_controller.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/repositories/product_repository.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/repositories/product_repository_interface.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/services/product_service.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/services/product_service_interface.dart';
import 'package:flutter_getx/theme/controllers/theme_controller.dart';
import 'package:flutter_getx/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  print('✅ SharedPreferences registered');

  // Register ApiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));
  print('✅ ApiClient registered');

  // Debug: Verify ApiClient registration
  if (Get.isRegistered<ApiClient>()) {
    print('✅ ApiClient is successfully registered');
  } else {
    print('❌ ApiClient registration failed');
  }

  // Register ProductRepository
  Get.lazyPut<ProductRepositoryInterface>(() => ProductRepository(apiClient: Get.find<ApiClient>()));
  print('✅ ProductRepository registered');

  // Debug: Verify ProductRepository registration
  if (Get.isRegistered<ProductRepositoryInterface>()) {
    print('✅ ProductRepository is successfully registered');
  } else {
    print('❌ ProductRepository registration failed');
  }

  // Register ProductService
  Get.lazyPut<ProductServiceInterface>(() => ProductService(productRepositoryInterface: Get.find<ProductRepositoryInterface>()));
  print('✅ ProductService registered');

  // Debug: Verify ProductService registration
  if (Get.isRegistered<ProductServiceInterface>()) {
    print('✅ ProductService is successfully registered');
  } else {
    print('❌ ProductService registration failed');
  }

  // Register Controllers
  Get.lazyPut(() => ThemeController(sharedPreferences));
  Get.lazyPut(() => ValleyHomeController(productServiceInterface: Get.find<ProductServiceInterface>()));
  print('✅ Controllers registered');
}

