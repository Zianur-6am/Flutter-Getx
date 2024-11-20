import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/food_campaign_controller.dart';
import 'package:get/get.dart';

class FoodCampaign extends StatelessWidget {

  FoodCampaignController foodCampaignController = Get.find();

  FoodCampaign({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
      builder: (FoodCampaignController foodCampaignController){
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodCampaignController.foodCampaignList.length,
            itemBuilder: (context, index){
              return SizedBox(
                width: 250,
                height: 110,
                child: Card(
                  color: Colors.white,
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              height: 80,
                              imageUrl: foodCampaignController.foodCampaignList[index].imageFullUrl.toString(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const CircularProgressIndicator(),
                              errorWidget: (context, url, error) => const Icon(Icons.error),

                            ),
                          ),
                        )
                    ),

                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '${foodCampaignController.foodCampaignList[index].name}',
                                style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                            ),

                            Expanded(
                              child: Text(
                                '${foodCampaignController.foodCampaignList[index].restaurantName}',
                                style: const TextStyle(fontSize: 10, color: Colors.black38), overflow: TextOverflow.ellipsis,),
                            ),

                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star, color: Colors.green, size: 14,),
                                Icon(Icons.star, color: Colors.green, size: 14,),
                                Icon(Icons.star, color: Colors.green, size: 14,),
                                Icon(Icons.star, color: Colors.green, size: 14,),
                                Icon(Icons.star, color: Colors.green, size: 14,),
                              ],),

                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Text('\$${foodCampaignController.foodCampaignList[index].price}',
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                              overflow: TextOverflow.ellipsis,)
                                        ),

                                        Text(
                                          '\$${foodCampaignController.foodCampaignList[index].discount}',
                                          style: const TextStyle(color: Colors.black38, decoration: TextDecoration.lineThrough),),
                                      ],),
                                  ),

                                  const Expanded(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.add),
                                    ],
                                  )),
                                ],),
                            )
                          ],),
                      ),
                    )
                  ],),
                ),
              );
            }
        );
      },
    );
  }
}
