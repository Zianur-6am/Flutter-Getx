import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page2Class extends StatelessWidget {
  const Page2Class({super.key});


  @override
  Widget build(BuildContext context) {

    //Getting the data from the previous page
    String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text("Route navigation Page-2"),),
      //could have used center widgets
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
              child: const Text("Go back to Page-1"),
          ),

            
            Text(data, style: const TextStyle(color: Colors.redAccent),)
        ],),
      ),
    );
  }
}
