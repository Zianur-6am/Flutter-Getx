import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/fetchapidata/commonmodule/AppColor.dart';
import 'package:flutter_getx/fetchapidata/productmodule/controllers/product_controller.dart';
import 'package:flutter_getx/fetchapidata/productmodule/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductListView extends StatelessWidget {
  // const ProductListView({super.key});

  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text("Product List"),),
      body: Obx((){
        if (productController.isLoading.value){
          return Center(child: CircularProgressIndicator(),);
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
                          margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: productController.productList[index].imageLink,
                              placeholder: (context, url) => new Icon(Icons.error),
                              errorWidget: (context, url, error) => new Icon(Icons.error),
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
                                  style: TextStyle(fontSize: 18),
                                ),

                                Text(
                                  productController.productList[index].brand,
                                  style: TextStyle(fontSize: 14),
                                ),

                                Text(
                                  productController.productList[index].category,
                                  style: TextStyle(fontSize: 14),
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
