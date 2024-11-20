import 'package:flutter/material.dart';
import 'package:flutter_getx/route_navigation/un_named_navigation/page1.dart';
import 'package:get/get.dart';

class BottomSheetClass extends StatelessWidget {
  const BottomSheetClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Sheet"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Get.bottomSheet(
                    //Bottom sheet will take full height because of this container
                    Container(
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.wb_sunny_outlined),
                            title: const Text("Light Theme"),
                            onTap: (){
                              Get.changeTheme(ThemeData.light());
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.wb_sunny),
                            title: const Text("Dark Theme"),
                            onTap: (){
                              Get.changeTheme(ThemeData.dark());
                            },
                          )
                        ],
                      ),
                    ),

                    //properties of bottomsheet

                    // barrierColor: Colors.blue,
                    backgroundColor: Colors.orange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      //borderRadius: BorderRadius.circular(10),
                    )
                  );
                },

              //for styling the elevated button
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                // textStyle: TextStyle(color: Colors.white),
              ),
                child:  const Text("Show Bottom Seet", style: TextStyle(color: Colors.white),),

            ),



            //button for routing example
            ElevatedButton(
                onPressed: (){
                  Get.to(
                    const Page1Class(),
                    transition: Transition.leftToRight,

                  );
                },
                child: const Text("Go to Page-1"),
            ),
          
        ],),
      ),
    );
  }
}
