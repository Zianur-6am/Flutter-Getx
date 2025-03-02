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


  final String _description = 'The fuel filter in your car is an imp asdjkhjkahs jahsdjka shdkjash dkortant '
      'component in keeping your engine running clean and efficiently. '
      'It removes impurities from the fuel before it to '
      'reaches the combustion chamber, preventing buildup impurities from the other thinks.'
      'Flutter is a popular open-source UI toolkit for building native mobile apps for iOS and Android. '
      ;


  final int _descriptionLength = 0;
  bool _isDescriptionExpandable = false;
  bool _isDescriptionExpanded = false;
  final String? _descriptionImage = 'https://picsum.photos/250?image=9';
  int get descriptionLength => _descriptionLength;
  String get description => _description;
  bool get isDescriptionExpandable => _isDescriptionExpandable;
  String? get descriptionImage => _descriptionImage;
  bool get isDescriptionExpanded => _isDescriptionExpanded;


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

  void calculationDescriptionExpandable (){

    if(_description.length > 460 || (descriptionImage != null && descriptionImage!.isNotEmpty)){
      _isDescriptionExpandable = true;
    }else{
      _isDescriptionExpandable = false;
    }
  }


  void setDescriptionExpanded(){
    _isDescriptionExpanded = !_isDescriptionExpanded;
    update();
  }

}