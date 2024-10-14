import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowDialogClass extends StatelessWidget {
  const ShowDialogClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Showdialog"),),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                //getx dialog
                Get.defaultDialog(
                  title: "Title of the dialog",
                  titleStyle: const TextStyle(fontSize: 25, color: Colors.white),
                  middleText: "This is middle text",
                  middleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
                  backgroundColor: Colors.black,
                  radius: 10,


                  //to customize the middle text
                  //overrides the middletext
                  content: const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(color: Colors.white,),
                      ),
                      SizedBox(width: 20,),
                      
                      Expanded(
                          child: Text("data loading........", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),

                  //Textbuttons for cancel and confirm
                  // textCancel: "Cancel",
                  // cancelTextColor: Colors.white,
                  //
                  // textConfirm: "Confirm",
                  // confirmTextColor: Colors.white,
                  //
                  // //on pressing cancel button
                  // onCancel: (){},
                  //
                  // //on pressing confirm button
                  // onConfirm: (){},


                  //Buttons can be implemented like this too
                  actions: [
                    ElevatedButton(
                        onPressed: (){
                          //cancels the dialog
                          Get.back();
                        },

                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text("cancel"),

                    ),
                    ElevatedButton(
                        onPressed: (){},

                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text("Confirm"),
                    ),
                  ],


                  //when set to false
                  // clicking outside the dialog will not cancel the dialog
                  barrierDismissible: false,






                );
              },

              child: const Text("Show Dialog")
          )
        ],),
      ),
      
    );
  }
}
