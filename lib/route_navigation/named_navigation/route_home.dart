import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouteHomeClass extends StatelessWidget {
  const RouteHomeClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route Home"),),
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
                child: const Text("Go to Screen1"),
            ),
          ],
        ),
      ),

    );
  }
}
