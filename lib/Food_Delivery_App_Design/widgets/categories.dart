import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/category_controller.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  CategoryController categoryController = Get.find();


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (CategoryController controller) {
        // print('============================>>>>>>>>>>>>>>>>${categoryController.categoryList.length}');
        return ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: categoryController.categoryList.length,

            itemBuilder: (context, index){
             return SizedBox(
               width: 80,
               child: Column(
                 children: [
                 Card(
                   elevation: 10,
                   color: Colors.white,
                   //Use cacheImageNetwork here
                   child: CachedNetworkImage(
                     height: 60,
                     width: 60,
                     fit: BoxFit.contain,
                     imageUrl: categoryController.categoryList[index].imageFullUrl.toString(),
                     placeholder: (context, url) => const CircularProgressIndicator(),
                     errorWidget: (context, url, error) => const Icon(Icons.error),
                   ),
                 ),

                 Padding(
                   padding: const EdgeInsets.only(top: 5),
                   child: Text(
                     categoryController.categoryList[index].name.toString(),
                     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                     overflow: TextOverflow.ellipsis,),
                 ),
               ],),
             );
            }
        );
      },
    );
  }
}

