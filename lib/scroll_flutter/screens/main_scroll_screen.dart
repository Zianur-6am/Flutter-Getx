import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_app_bar.dart';
import 'package:get/get.dart';

class MainScrollScreen extends StatefulWidget {
  const MainScrollScreen({super.key});

  @override
  State<MainScrollScreen> createState() => _MainScrollScreenState();
}

class _MainScrollScreenState extends State<MainScrollScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(title: 'ScrollController and ScrollNotification'),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/scroll_1"
                  );
                },
                child: const Text("Explore Screen"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/scroll_2"
                  );
                },
                child: const Text("Explore Screen"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/scroll_3"
                  );
                },
                child: const Text("Explore Screen"),
              ),

            ]),
      ),
    );
  }
}
