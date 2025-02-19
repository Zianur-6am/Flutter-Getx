
import 'package:flutter/material.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/nav_controller.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/screens/fd_home.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  // const BottomNavBar({super.key});

  BottomNavController bottomNavController = Get.put(BottomNavController());

  BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder(
        builder: (BottomNavController controller){
        return IndexedStack(
          index: bottomNavController.selectedIndex,
          children: const [
            FDHome(),
            Center(child: Text('Favorite Page')),
            Center(child: Text('Edit Note Page')),
            Center(child: Text('Menu Page')),
          ],
        );
      },),


      floatingActionButton: FloatingActionButton.large(
        backgroundColor: Colors.green,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.local_grocery_store, color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        shape: const CircularNotchedRectangle(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        color: Colors.white,
        notchMargin: 5,
        child: Row(mainAxisSize: MainAxisSize.max, children: [


            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: GetBuilder(
                        builder: (BottomNavController controller){
                          return Icon(
                            Icons.home,
                            color: bottomNavController.selectedIndex == 0 ? Colors.green : Colors.black,
                            size: 30,
                          );
                    }),
                    onPressed: () {
                      bottomNavController.changeTabIndex(0);
                    },
                  ),
              
                  IconButton(
                    icon: GetBuilder(
                        builder: (BottomNavController controller){
                          return Icon(
                            Icons.favorite,
                            color: bottomNavController.selectedIndex == 1 ? Colors.green : Colors.black,
                            size: 30,
                          );
                        }),
                    onPressed: () {
                      bottomNavController.changeTabIndex(1);
                    },
                  ),
                ],
              ),
            ),

            Expanded(child: Container()),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: GetBuilder(
                        builder: (BottomNavController controller){
                          return Icon(
                            Icons.edit_note_rounded,
                            color: bottomNavController.selectedIndex == 2 ? Colors.green : Colors.black,
                            size: 30,
                          );
                        }),
                    onPressed: () {
                      bottomNavController.changeTabIndex(2);
                    },
                  ),
              
                  IconButton(
                    icon: GetBuilder(
                        builder: (BottomNavController controller){
                          return Icon(
                            Icons.menu,
                            color: bottomNavController.selectedIndex == 3 ? Colors.green : Colors.black,
                            size: 30,
                          );
                        }),
                    onPressed: () {
                      bottomNavController.changeTabIndex(3);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );



    ///implementing with reactive state management
    //   body: Obx(() {
    //     // This will reactively update the screen based on the selected index
    //     //this is used to show selected widgets
    //     //index refers to position of the widgets defined in it
    //     return IndexedStack(
    //       index: bottomNavController.selectedIndex.value,
    //       children: const [
    //         Home(),
    //         Center(child: Text('Favorite Page')),
    //         Center(child: Text('Edit Note Page')),
    //         Center(child: Text('Menu Page')),
    //       ],
    //     );
    //   }),
    //
    //
    //   floatingActionButton: FloatingActionButton.large(
    //     backgroundColor: Colors.green,
    //     onPressed: () {},
    //     child: const Icon(Icons.local_grocery_store, color: Colors.white,),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(100),
    //     ),
    //   ),
    //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //
    //
    //   bottomNavigationBar: BottomAppBar(
    //     elevation: 5,
    //     shape: const CircularNotchedRectangle(),
    //     padding: const EdgeInsets.symmetric(horizontal: 10),
    //     height: 60,
    //     color: Colors.white,
    //     notchMargin: 5,
    //     child: Row(
    //       mainAxisSize: MainAxisSize.max,
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             IconButton(
    //               icon: Obx(() {
    //                   return Icon(
    //                     Icons.home,
    //                     color: bottomNavController.selectedIndex.value == 0 ? Colors.green : Colors.black,
    //                     size: 30,
    //                   );
    //                 }
    //               ),
    //               onPressed: () {
    //                 bottomNavController.changeTabIndex(0);
    //               },
    //             ),
    //
    //             Padding(
    //               padding: const EdgeInsets.only(left: 30),
    //               child: IconButton(
    //                 icon: Obx(() {
    //                     return Icon(
    //                       Icons.favorite,
    //                       color: bottomNavController.selectedIndex.value == 1 ? Colors.green : Colors.black,
    //                       size: 30,
    //                     );
    //                   }
    //                 ),
    //                 onPressed: () {
    //                   bottomNavController.changeTabIndex(1);
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //
    //         Expanded(child: Text('')),
    //
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(right: 30),
    //               child: IconButton(
    //                 icon: Obx(() {
    //                     return Icon(
    //                       Icons.edit_note,
    //                       color: bottomNavController.selectedIndex.value == 2 ? Colors.green : Colors.black,
    //                       size: 30,
    //                     );
    //                   }
    //                 ),
    //                 onPressed: () {
    //                   bottomNavController.changeTabIndex(2);
    //                 },
    //               ),
    //             ),
    //           ],
    //         ),
    //         IconButton(
    //           icon: Obx(() {
    //               return Icon(
    //                 Icons.menu,
    //                 color: bottomNavController.selectedIndex.value == 3 ? Colors.green : Colors.black,
    //                 size: 30,
    //               );
    //             }
    //           ),
    //           onPressed: () {
    //             bottomNavController.changeTabIndex(3);
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
