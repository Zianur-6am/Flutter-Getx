import 'dart:ui';

import 'package:get/get.dart';

class Icontroller extends GetxController{

  //param1 is language code and param2 is country code
  void changeLanguage(var param1, var param2){

    //we need to change the locale and update it
    var locale = Locale(param1, param2);
    Get.updateLocale(locale);
  }

}