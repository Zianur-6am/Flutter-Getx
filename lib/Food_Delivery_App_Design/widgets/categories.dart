import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/category_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
             return Padding(
                padding: const EdgeInsets.only(right: 8,),
                child: Column(children: [
                  Card(
                    // elevation: 10,
                    color: Colors.white,
                    //Use cacheImageNetwork here
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CachedNetworkImage(
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        imageUrl: categoryController.categoryList[index].imageFullUrl.toString(),
                        placeholder: (context, url) => new CircularProgressIndicator(),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${categoryController.categoryList[index]!.name.toString()}'),
                  ),
                ],),
              );
            }
        );
      },
    );
  }
}

