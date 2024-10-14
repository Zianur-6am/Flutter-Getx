import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/Internationalization/icontroller.dart';
import 'package:get/get.dart';

class Ihome extends StatelessWidget {
  // const Ihome({super.key});
  
  Icontroller icontroller = Get.put(Icontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Internalization"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //must put .tr
            Text('hello'.tr, style: TextStyle(fontSize: 25, color: Colors.purple),),

            ElevatedButton(
                onPressed: (){
                  icontroller.changeLanguage('hi', "IN");
                },
                child: const Text("Hindi")
            ),
            SizedBox(height: 10,),

            ElevatedButton(
                onPressed: (){
                  icontroller.changeLanguage('fr', "FR");
                },
                child: const Text("French")
            ),
            SizedBox(height: 10,),

            ElevatedButton(
                onPressed: (){
                  icontroller.changeLanguage('en', "US");
                },
                child: const Text("English")
            ),
          ],
        ),
      ),
    );
  }
}

