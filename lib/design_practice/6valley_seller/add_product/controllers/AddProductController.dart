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


  void  setSelectedPageIndex (int index, {bool isUpdate = true}){
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

}