import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen2Class extends StatelessWidget {
  const Screen2Class({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen2"),),
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
                child: const Text("Go back"),
            ),

            //getting the value from the dynamic url
            Text("The developeer is ${Get.parameters['dev']} and the stack is ${Get.parameters['stack']}")
          ],
        ),
      ),
    );
  }
}
