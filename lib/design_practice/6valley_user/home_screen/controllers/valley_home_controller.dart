import 'package:get/get.dart';

class ValleyHomeController extends GetxController implements GetxService{
  int _selectedTabIndex = 0;
  int get selectedTabIndex => _selectedTabIndex;

  void updateTabIndex({required int index, bool isUpdate = true}){
    _selectedTabIndex = index;

    if(isUpdate){
      update();
    }
  }
}