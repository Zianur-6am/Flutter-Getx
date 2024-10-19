import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/food_campaign_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class FoodCampaign extends StatelessWidget {

  FoodCampaignController foodCampaignController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
        builder: (FoodCampaignController foodCampaignController){
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodCampaignController.foodCampaignList.length,
              itemBuilder: (context, index){
              return SizedBox(
                height: 100,
                width: 250,
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
                              imageUrl: foodCampaignController.foodCampaignList[index].imageFullUrl.toString(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => new CircularProgressIndicator(),
                              errorWidget: (context, url, error) => new Icon(Icons.error),

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
                              style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
                          ),

                          Expanded(
                            child: Text(
                              '${foodCampaignController.foodCampaignList[index].restaurantName}',
                              style: TextStyle(fontSize: 10, color: Colors.black38), overflow: TextOverflow.ellipsis,),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Icon(Icons.star, color: Colors.green, size: 14,),
                            Icon(Icons.star, color: Colors.green, size: 14,),
                            Icon(Icons.star, color: Colors.green, size: 14,),
                            Icon(Icons.star, color: Colors.green, size: 14,),
                            Icon(Icons.star, color: Colors.green, size: 14,),
                          ],),

                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Expanded(
                                        child: Text('\$${foodCampaignController.foodCampaignList[index].price}',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,)
                                    ),

                                    Text('\$${foodCampaignController.foodCampaignList[index].discount}', style: TextStyle(color: Colors.black38, decoration: TextDecoration.lineThrough),),
                                  ],),
                                ),

                                Expanded(child: Row(
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
      )
    ) ;
  }
}
