import 'package:flutter/material.dart';
import 'package:flutter_getx/common/enum/product_type.dart';
import 'package:flutter_getx/data/api/api_client.dart';
import 'package:flutter_getx/data/model/api_response.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/repositories/product_repository_interface.dart';


class ProductRepository implements ProductRepositoryInterface{
  final ApiClient? apiClient;
  ProductRepository({required this.apiClient});

  @override
  Future<ApiResponse> getFilteredProductList(BuildContext context, String offset, ProductType productType, String? title) async {
    late String endUrl = '/api/v1/products/new-arrival?guest_id=1&limit=10&&offset=';

    try {
      final response = await apiClient!.getData(
        endUrl+offset);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(e);
    }
  }




  @override
  Future add(value) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }



  @override
  Future getList({int? offset = 1}) {
    // TODO: implement getList
    throw UnimplementedError();
  }


  @override
  Future update(Map<String, dynamic> body, int id) {
    // TODO: implement update
    throw UnimplementedError();
  }

}