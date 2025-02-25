import 'package:flutter/material.dart';
import 'package:flutter_getx/common/enum/product_type.dart';
import 'package:flutter_getx/interface/repo_interface.dart';
abstract class ProductRepositoryInterface<T> extends RepositoryInterface{

  Future<dynamic> getFilteredProductList(BuildContext context,String offset, ProductType productType, String? title);

}
