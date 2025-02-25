import 'package:flutter/material.dart';
import 'package:flutter_getx/common/enum/product_type.dart';

abstract class ProductServiceInterface{
  Future<dynamic> getFilteredProductList(BuildContext context,String offset, ProductType productType, String? title);
}