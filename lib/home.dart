import 'package:flutter/material.dart';
import 'package:flutter_getx/main.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                    "/named_route_home"
                  );
                },
                child: Text("Named Route"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                  "/unnamed_route"
                );
              },
              child: Text("Unamed Route"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                  "/dialog"
                );
              },
              child: Text("Dialog"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                    "/snackbar"
                );
              },
              child: Text("Snackbar"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                    "/bottomsheet"
                );
              },
              child: Text("Bottomsheet"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                    "/rsm"
                );
              },
              child: Text("Reactive State Manager"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                    "/ssm"
                );
              },
              child: Text("Simple State Manager"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                    "/ihome"
                );
              },
              child: const Text("Internationalization"),
            ),

            ElevatedButton(
              onPressed: (){
                Get.toNamed(
                    "/plv"
                );
              },
              child: const Text("Internationalization"),
            ),
        ],),
      ),
    );
  }
}
