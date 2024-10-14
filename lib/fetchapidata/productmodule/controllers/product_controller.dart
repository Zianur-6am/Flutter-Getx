import 'package:flutter_getx/fetchapidata/apimodule/api_service.dart';
import 'package:flutter_getx/fetchapidata/productmodule/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {

    try {
      isLoading(true);
      var produts = await ApiService.fetchProducts();
      if(produts != null){
        productList.assignAll(produts);
      }
    }finally{
      isLoading(false);
    }
  }

}