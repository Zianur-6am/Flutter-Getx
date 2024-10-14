import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_util_class/student.dart';

//Controller is nothing but doing the student class initialization and
//updating part in the that class and calling from the main class




/// Do not need to see this go straight to the simple state manager**********



class ReactiveSMClass extends StatelessWidget {
 ReactiveSMClass({super.key});

  // //for the variable as reactive
  // Student student = Student();

 final student = Student(name: "Jerry", age: 33).obs;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page not found"),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "Name is ${student.value.name}",
              style: TextStyle(fontSize: 25),
            )),
            
            ElevatedButton(
                onPressed: (){
                  // //if individual variable is obs (observable)
                  // student.name.value = student.name.value.toUpperCase();

                  //if entire class is observable
                  //calling update method to update
                  student.update((student){
                    student?.name = student.name.toString().toUpperCase();
                  });
                },
                child: Text("Upper Case Name"),
            ),

            ElevatedButton(
              onPressed: (){
                // //if individual variable is obs (observable)
                // student.name.value = student.name.value.toLowerCase();


                //calling update method to update
                student.update((student){
                  student?.name = student.name.toString().toLowerCase();
                });
              },
              child: Text("Lower Case Name"),
            ),

          ],
        ),
      ),
    );
  }
}
