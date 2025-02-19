import 'package:flutter/material.dart';
import 'package:flutter_getx/route_navigation/un_named_navigation/page2.dart';
import 'package:get/get.dart';

class Page1Class extends StatelessWidget {
  const Page1Class({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Route navigation Page-1"),),
      //could have used center widgets
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ElevatedButton(
            onPressed: () async {
              // //For routing to Page-2
              // Get.to(
              //     Page2Class(),
              //
              //   //opening next screen as a fullscreen Dialog
              //   // fullscreenDialog: true,
              //
              //   //transition of the route
              //   transition: Transition.leftToRight,
              //   duration: Duration(milliseconds: 3000),
              // );




              // //can not return to the previous screen but
              // //returns to the screen before the previous page
              // Get.off(Page2Class());



              // //Cancel previous all screens
              // Get.offAll(Page2Class());


              // //Go to the next screen with some data
              // Get.to(
              //     Page2Class(),
              //     arguments: "Passing some data",
              //     transition: Transition.leftToRight,
              // );


              //Come back from the next screen with some data
              var data = await Get.to(
                const Page2Class(),
                arguments: "Passing some data",
                transition: Transition.leftToRight,
              );

              print("$data");


            },
            child: const Text("Go to Page-2"),
          ),

        ],),
      ),
    );
  }
}
