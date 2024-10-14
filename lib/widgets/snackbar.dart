import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarClass extends StatelessWidget {
  const SnackbarClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snackbar"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: (){
                //getx snackbar
                Get.snackbar(
                  //title and message must needed for the snackbar
                  "Snackbar Title",
                  "This is snackbar message........",
                  colorText: Colors.white,
                  //background will not work if background gradient is set
                  backgroundColor: Colors.black,
                  snackPosition: SnackPosition.BOTTOM,
                  //these overrides the above title and message
                  // titleText: const Text("Another title", style: TextStyle(color: Colors.red),),
                  // messageText: const Text("Aother message"),
                  borderRadius: 10,
                  margin: const EdgeInsets.all(30),
                  backgroundGradient: const LinearGradient(
                    colors: [Colors.red, Colors.green],
                  ),

                  isDismissible: true,
                  dismissDirection: DismissDirection.horizontal,

                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),


                  //on tapping the snackbar
                  onTap: (val){

                  },
                  //blurs the screen except the snackbar
                  overlayBlur: 5,

                  //duration of the snackbar
                  duration: const Duration(milliseconds: 8000),


                  //used to take input from snackbar

                  // userInputForm: const Form(child: Row( children: [
                  //   Expanded(child: TextField()),
                  // ],)),
                  //



                );
              },
              child: const Text("Show Snackbar")),
        ],
      ),

      ),
    );
  }
}
