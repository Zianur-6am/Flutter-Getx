import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/fetchapidata/commonmodule/AppColor.dart';
import 'package:flutter_getx/fetchapidata/productmodule/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductListView extends StatelessWidget {

  final ProductController productController = Get.put(ProductController());

  ProductListView({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: const Text("Product List"),),
      body: Obx((){
        if (productController.isLoading.value){
          return const Center(child: CircularProgressIndicator(),);
        }
        else{
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 100,
                          margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: productController.productList[index].imageLink,
                              placeholder: (context, url) => const Icon(Icons.error),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                            ),
                            // Image.network(
                            //   productController.productList[index].imageLink,
                            //   width: 150,
                            //   height: 100,
                            //   fit: BoxFit.fill,
                            //   color: AppColor.purpleColor,
                            //   colorBlendMode: BlendMode.color,
                            // ),

                          ),
                        ),

                        Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productController.productList[index].name,
                                  style: const TextStyle(fontSize: 18),
                                ),

                                Text(
                                  productController.productList[index].brand,
                                  style: const TextStyle(fontSize: 14),
                                ),

                                Text(
                                  productController.productList[index].category,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],

                            ),
                        ),

                      ],
                    ),

                    Container(
                      color: AppColor.grey200,
                      height: 2,
                    ),
                  ],
                );

              }
          );
        }
      }),
    );
  }
}
