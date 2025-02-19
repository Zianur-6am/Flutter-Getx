import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen"),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/explore"
                  );
                },
                child: const Text("Explore Screen"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/valley_home"
                  );
                },
                child: const Text("6Valley home"),
              ),


              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/add_product"
                  );
                },
                child: const Text("Add Product"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/blog_screen"
                  );
                },
                child: const Text("Tab Bar"),
              ),

              ElevatedButton(
                  onPressed: (){
                    Get.toNamed(
                      "/named_route_home"
                    );
                  },
                  child: const Text("Named Route"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                    "/unnamed_route"
                  );
                },
                child: const Text("Unamed Route"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                    "/dialog"
                  );
                },
                child: const Text("Dialog"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/snackbar"
                  );
                },
                child: const Text("Snackbar"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/bottomsheet"
                  );
                },
                child: const Text("Bottomsheet"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/rsm"
                  );
                },
                child: const Text("Reactive State Manager"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/ssm"
                  );
                },
                child: const Text("Simple State Manager"),
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
                child: const Text("Fetch Data"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/fdhome"
                  );
                },
                child: const Text("Food Delivery App Design"),
              ),

              ElevatedButton(
                onPressed: (){
                  Get.toNamed(
                      "/exptl"
                  );
                },
                child: const Text("Expansion Tile"),
              ),

          ],),
        ),
      ),
    );
  }
}
