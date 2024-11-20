//
// State Management
// Need to make the changeable variable
// Reactive or observable, we can make the variable reactive in many ways. One of them is .obs
// Then we need to put the widget that contains the changeable
// variable inside obx()
// Classes can be made reactive by —------>
// 1. Making every variable instance variable reactive.
// 2.making the the entire class observable (add .obs after constructor when creating an object).
//And we need to call the update method to update the value.

class Student{

  //by making variable reactive
  // var name = 'tom'.obs;
  // var age = 1.obs;



  //making the whole class reactive
  var name;
  var age;
  Student({this.name, this.age});

}