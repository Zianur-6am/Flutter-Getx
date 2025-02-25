import 'package:flutter_getx/common/enum/product_type.dart';
import 'package:flutter_getx/data/model/api_response.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/domain/models/product_model.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/services/product_service_interface.dart';
import 'package:flutter_getx/helper/api_checker.dart';
import 'package:get/get.dart';

class ValleyHomeController extends GetxController implements GetxService{
  final ProductServiceInterface? productServiceInterface;

  ValleyHomeController({required this.productServiceInterface});

  List<String> items = List.generate(10, (index) => "New Item");

  List<String> newItems = List.generate(10, (index) => "Item");

  int totalSize = 30;
  int offset = 1;
  int limit = 10;

  int _itemCount = 10;
  int get itemCount => _itemCount;

  bool _isLoading = true;
  bool get isLoading => _isLoading;


  Future<void> getItem() async {

    /// if all item has been fetched
    if(offset >= (totalSize / limit)) return;

    _isLoading = true;

    // Simulate a delay (like making an API call)
    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    items.addAll(newItems);

    updateOffset(newValue: offset+1);
  }

  void updateOffset({required int newValue, bool isUpdate = true}){

    offset = newValue;

    if(isUpdate){
      update();
    }
  }


  /// with api calling

  ProductModel? _productModel;
  ProductModel? get productModel => _productModel;

  final String? _title = 'best_selling'.tr;
  String? get title => _title;

  ProductType _productType = ProductType.newArrival;
  ProductType get productType => _productType;

  List<Product>? _latestProductList = [];
  List<Product>? get latestProductList => _latestProductList;
  List<int> _offsetList = [];
  int _lOffset = 1;
  int get lOffset => _lOffset;

  int? _latestPageSize = 1;
  int? get latestPageSize => _latestPageSize;




  Future<void> getLatestProductList(int offset, {bool reload = false, bool isUpdate = true}) async {
    print('----------printingoffset-----------$offset');
    if(reload || offset == 1) {
      _productModel = null;
    }

    if(isUpdate){
      update();
    }
    print('------------before length-----------${_productModel?.products?.length}');

    ApiResponse apiResponse = await productServiceInterface!.getFilteredProductList(Get.context!, offset.toString(), _productType, title);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      if(offset==1){
        _productModel = ProductModel.fromJson(apiResponse.response?.body);
      }else{
        _productModel?.offset = ProductModel.fromJson(apiResponse.response?.body).offset;
        _productModel?.totalSize = ProductModel.fromJson(apiResponse.response?.body).totalSize;
        _productModel?.products?.addAll(ProductModel.fromJson(apiResponse.response?.body).products ?? []);

        print('------------after length-----------${_productModel?.products?.length}');

      }

    } else {
      ApiChecker.checkApi( apiResponse);
    }
    update();

  }
}

