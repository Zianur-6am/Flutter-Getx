import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Page2Class extends StatelessWidget {
  const Page2Class({super.key});


  @override
  Widget build(BuildContext context) {

    //Getting the data from the previous page
    String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Route navigation Page-2"),),
      //could have used center widget
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(
              onPressed: (){
                // //normal back
                // Get.back();


                //Returning some data to the previous screen
                Get.back(result: '=============================>>>>>>>>>>>passing data to previous page');
              },
              child: Text("Go back to Page-1"),
          ),

            
            Text("$data", style: TextStyle(color: Colors.redAccent),)
        ],),
      ),
    );
  }
}
