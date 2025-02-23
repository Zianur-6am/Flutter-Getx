import 'package:get/get.dart';

class ValleyHomeController extends GetxController implements GetxService{

  List<String> items = List.generate(10, (index) => "New Item");

  List<String> newItems = List.generate(10, (index) => "Item");

  int totalSize = 30;
  int offset = 1;
  int limit = 10;

  int _itemCount = 10;
  int get itemCount => _itemCount;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getItem() async {

    /// if all item has been fetched
    if(offset > (totalSize / limit)) return;

    _isLoading = true;

    // Simulate a delay (like making an API call)
    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    items.addAll(newItems);

    updateOffset(newValue: offset+1);
  }

  void updateOffset({required int newValue, bool isUpdate = true}){

    offset = newValue;

    if(isUpdate){
      update();
    }
  }
}

