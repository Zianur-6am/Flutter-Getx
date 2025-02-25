import 'package:flutter/material.dart';
import 'package:flutter_getx/common/enum/product_type.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/repositories/product_repository_interface.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/domain/services/product_service_interface.dart';

class ProductService implements ProductServiceInterface{
  ProductRepositoryInterface productRepositoryInterface;

  ProductService({required this.productRepositoryInterface});

  @override


  @override
  Future getFilteredProductList(BuildContext context, String offset, ProductType productType, String? title) async{
    return await productRepositoryInterface.getFilteredProductList(context, offset, productType, title);
  }

}