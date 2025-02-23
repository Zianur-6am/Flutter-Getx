import 'package:get/get.dart';

class ValleyHomeController extends GetxController implements GetxService{
  int _itemCount = 10;
  int get itemCount => _itemCount;

  void updateItemCount({required int count, bool isUpdate = true}){
    _itemCount = count;

    if(isUpdate){
      update();
    }
  }
}