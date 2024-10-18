import 'package:get/get.dart';

class BottomNavController extends GetxController {

  ///implementing with reactive state management
  // Observable variable for current tab index
  // var selectedIndex = 0.obs;


  ///implementing with simple state management
  var selectedIndex = 0;

  // Method to change the index
  void changeTabIndex(int index) {
    selectedIndex = index;
    update();
  }


}