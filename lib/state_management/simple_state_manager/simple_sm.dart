import 'package:flutter/material.dart';
import 'package:flutter_getx/state_management/simple_state_manager/simple_controller.dart';
import 'package:get/get.dart';

class SimpleSMClass extends StatelessWidget {
  const SimpleSMClass({super.key});

  // const SimpleSMClass({super.key});


  // //Dipendency injection
  // //declaring the controller instance globally
  // SimpleController simpleController = Get.put(SimpleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple State Manager"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [

            GetBuilder<SimpleController>(
              init: SimpleController(),
              builder: (SimpleController controller) {
                return Text("Button pressed = ${controller.pCount}",
                style: const TextStyle(fontSize: 25),);
              },
            ),

            GetBuilder<SimpleController>(
              init: SimpleController(),
              builder: (SimpleController controller) {
                return Text("Value is = ${controller.vCount}",
                  style: const TextStyle(fontSize: 25),);
              },
            ),
            const SizedBox(height: 10,),

            ElevatedButton(
                onPressed: (){

                  // //for global instance
                  // simpleController.incrementValueCount();
                  // simpleController.incrementPressCount();




                  //when controller instance is not global
                  Get.find<SimpleController>().incrementPressCount();
                  Get.find<SimpleController>().incrementValueCount();

            },
                child: const Text("Add")),

          ],
        ),
      ),
    );
  }
}
