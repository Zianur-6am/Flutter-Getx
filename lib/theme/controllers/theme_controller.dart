import 'package:flutter_getx/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



///Theme controller without shared preference and functionality -> just for using color

class ThemeController extends GetxController implements GetxService{
  // final SharedPreferences? sharedPreferences;
  ThemeController() {
    // _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  // void toggleTheme() {
  //   _darkTheme = !_darkTheme;
  //   sharedPreferences!.setBool(AppConstants.theme, _darkTheme);
  //   update();
  // }

  // void _loadCurrentTheme() async {
  //   _darkTheme = sharedPreferences!.getBool(AppConstants.theme) ?? false;
  //   update();
  // }
}
