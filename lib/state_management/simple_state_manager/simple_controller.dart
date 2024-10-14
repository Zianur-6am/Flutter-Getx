import 'package:get/get.dart';

class SimpleController extends GetxController{

  var pCount = 0, vCount = 0;

  void incrementPressCount(){

    pCount++;
    //this method will update the new value to everywhere
    update();

  }

  void incrementValueCount(){

    vCount = vCount+2;
    //this method will update the new value to everywhere
    update();

  }



}