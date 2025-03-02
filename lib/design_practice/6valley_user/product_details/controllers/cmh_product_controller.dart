import 'package:get/get.dart';

class CmhProductController extends GetxController implements GetxService {
  List<String> hexColors = [
    "#FF5733", // Red-Orange
    "#33FF57", // Green
    "#3357FF", // Blue
    "#FF33A1", // Pink
    "#FFD700", // Gold
    // "#A569BD", // Purple
    // "#5DADE2", // Light Blue
    // "#DC7633", // Burnt Orange
    // "#2ECC71", // Emerald Green
    // "#E74C3C", // Red
    // "#F1C40F", // Yellow
    // "#16A085", // Teal
    // "#34495E", // Dark Grayish Blue
    // "#1ABC9C", // Turquoise
    // "#D35400", // Dark Orange
    // "#C0392B", // Dark Red
    // "#8E44AD", // Dark Purple
    // "#2980B9", // Strong Blue
    // "#27AE60", // Dark Green
    // "#F39C12", // Orange-Yellow
  ];

  List<String> productSize = ["S", "M", "L", "XL", "XXL"];

  int _selectedColorIndex = 0;
  int get selectedColorIndex => _selectedColorIndex;

  int _selectedSizeIndex = 0;
  int get selectedSizeIndex => _selectedSizeIndex;


  void updateSelectedColorIndex(int index, {bool isUpdate = true}){
    _selectedColorIndex = index;

    if(isUpdate){
      update();
    }
  }

  void updateSelectedSizeIndex(int index, {bool isUpdate = true}){
    _selectedSizeIndex = index;

    if(isUpdate){
      update();
    }
  }

}