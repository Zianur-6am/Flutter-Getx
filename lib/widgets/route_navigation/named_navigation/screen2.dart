import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Screen2Class extends StatelessWidget {
  const Screen2Class({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen2"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  //normal back
                  Get.back();

                  Get.offNamed("/home");
                },
                child: Text("Go back"),
            ),

            //getting the value from the dynamic url
            Text("The developeer is ${Get.parameters['dev']} and the stack is ${Get.parameters['stack']}")
          ],
        ),
      ),
    );
  }
}
