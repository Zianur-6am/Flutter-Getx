import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService{

  HomeController();

  int _blogCount = 5;
  int get blogCount => _blogCount;

  void initialBlogCount(){
    _blogCount = 5;
  }

  void increaseBlogCount({bool isUpdate = true}){
    _blogCount = _blogCount + 5;

    if(isUpdate){
      update();
    }
  }

}