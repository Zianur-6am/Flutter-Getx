import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController implements GetxService {

  List<String> pages = ['General Info', 'Variation Setup', 'Product Seo'];
  int? _selectedPageIndex = 0;
  int? get selectedPageIndex => _selectedPageIndex;

  List<String> tabBarNames = ['English', 'Arabic', 'Bangla', 'Hindi'];
  final List<TextEditingController> _titleControllerList = List.generate(4, (index) => TextEditingController());
  List<TextEditingController>  get titleControllerList=> _titleControllerList;
  final List<TextEditingController> _descriptionControllerList = List.generate(4, (index) => TextEditingController());
  List<TextEditingController>  get descriptionControllerList=> _descriptionControllerList;

  List<String> categoryList = ["Category 1", "Category 2", "Category 3", "Category 7", "Category 4", "Category 5", "Category 6"];
  String? _categoryIndex = '';
  String? get categoryIndex => _categoryIndex;


  List<String> subCategoryList = ["Sub 1", "Sub 2", "Sub 3", "Sub 7", "Sub 4", "Sub 5", "Sub 6"];
  String? _subCategoryIndex = '';
  String? get subCategoryIndex => _subCategoryIndex;


  List<String> brandList = ["brand 1", "brand 2", "brand 3", "brand 4", "brand 5", "brand 6", "brand 7"];
  String? _brandIndex;
  String? get brandIndex => _brandIndex;

  int _productTypeIndex = 0;
  int get productTypeIndex => _productTypeIndex;

  final TextEditingController _productCode = TextEditingController();
  TextEditingController get productCode => _productCode;

  int _digitalProductTypeIndex = 0;
  int get digitalProductTypeIndex => _digitalProductTypeIndex;


  void setProductTypeIndex (int index, bool notify){
    _productTypeIndex = index;
    if(notify) {
      update();
    }
  }


  void setSelectedPageIndex (int index, {bool isUpdate = true}){
    _selectedPageIndex = index;
    if(isUpdate) {
      update();
    }
  }

  void setTitle(int index, String title) {
    _titleControllerList[index].text = title;
  }

  void setDescription(int index, String description) {
    _descriptionControllerList[index].text = description;
  }

  void setCategoryIndex(String? index, bool notify) {
    _categoryIndex = index;
    if(notify) {
      update();
    }
  }


  void setSubCategoryIndex(String? index, bool notify) {
    _subCategoryIndex = index;
    if(notify) {
      update();
    }
  }

  void setBrandIndex(String? index, bool notify) {
    _brandIndex = index;
    if(notify) {
      update();
    }
  }

  void setDigitalProductTypeIndex (int index, {bool isUpdate = true}){
    _productTypeIndex = index;
    if(isUpdate) {
      update();
    }
  }



}