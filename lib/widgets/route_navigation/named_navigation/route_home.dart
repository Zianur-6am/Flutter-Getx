import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RouteHomeClass extends StatelessWidget {
  const RouteHomeClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Route Home"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                    "/screen1"
                  );
                },
                child: Text("Go to Screen1"),
            ),
          ],
        ),
      ),

    );
  }
}
