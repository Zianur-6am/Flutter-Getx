import 'package:get/get.dart';

class AddProductController extends GetxController implements GetxService {
  List<String> pages = ['General Info', 'Variation Setup', 'Product Seo'];
  int? _selectedPageIndex = 0;
  int? get selectedPageIndex => _selectedPageIndex;


  void  setSelectedPageIndex (int index, {bool isUpdate = true}){
    _selectedPageIndex = index;
    if(isUpdate) {
      update();
    }
  }

}