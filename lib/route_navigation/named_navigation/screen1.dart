import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen1Class extends StatefulWidget {
  const Screen1Class({super.key});

  @override
  State<Screen1Class> createState() => _Screen1ClassState();
}

class _Screen1ClassState extends State<Screen1Class> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen1"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){

                  // Get.toNamed(
                  //   "/screen2"
                  // );

                  // //cancels previous page
                  // //will jump to the page before the previous page
                  // Get.offNamed("/screen2");

                  // //cancels all the previous pages
                  // Get.offAllNamed("/screen2");



                  //Dynamic URL Link
                  Get.toNamed(
                      "/screen2?dev=Zianur Rahman&stack=flutter"
                  );
                },
                child: const Text("Go to screen2")
            ),
          ],
        ),
      ),
    );
  }
}
