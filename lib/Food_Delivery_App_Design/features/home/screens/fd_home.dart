
import 'package:flutter/material.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/banner_controller.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/category_controller.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/food_campaign_controller.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/popular_food_controller.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/widgets/banners.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/widgets/categories.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/widgets/food_campaign.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/widgets/popular_food_nearby.dart';
import 'package:get/get.dart';

class FDHome extends StatefulWidget {
  const FDHome({super.key});

  @override
  State<FDHome> createState() => _FDHomeState();
}

class _FDHomeState extends State<FDHome> {
  // const FDHome({super.key});
  CategoryController categoryController = Get.put(CategoryController());
  FoodCampaignController foodCampaignController = Get.put(FoodCampaignController());
  PopularFoodController popularFoodController = Get.put(PopularFoodController());
  BannerController bannerController = Get.put(BannerController());

  @override
  void initState() {
    // TODO: implement initState

    categoryController.getCategories();
    foodCampaignController.getFoodsCampaign();
    popularFoodController.getProduct();
    bannerController.getBannerList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(children: [
        Icon(Icons.home, color: Colors.black38,),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(4),
            child: Text('76,A eighth evenue, New York, US', style: TextStyle(color: Colors.black38, fontSize: 16), overflow: TextOverflow.ellipsis,),
          ),
        ),

        // Icon(Icons.notifications),
      ],),

        actions: const [
          Padding(
          padding: EdgeInsets.only(right: 15),
          child: Icon(Icons.notifications),),
        ],
      ),


      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              //search card
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                elevation: 2,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(children: [
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            textInputAction: TextInputAction.go,
                            onSubmitted: (value){},
                            decoration: const InputDecoration(
                              hintText: "Search food or restaurent here.....",
                              hintStyle: TextStyle(color: Colors.black38),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),

                      const Expanded(flex : 1, child: Icon(Icons.search, color: Colors.black38,)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),

            //banner
            Banners(),
            const SizedBox(height: 10,),



            //categories
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(children: [
                Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                Expanded(child: Text(''),),

                Text('View all', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, decorationColor: Colors.green, color: Colors.green),),
              ],),
            ),
            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 100,
                child: Categories(),
              ),
            ),
            const SizedBox(height: 10,),

            //Popular Food Nearby
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(children: [
                Text('Popular Food Nearby', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                Expanded(child: Text(''),),

                Text('View all', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, decorationColor: Colors.green, color: Colors.green),),
              ],),
            ),
            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 200,
                child: PopularFoodNearby(),
              ),
            ),
            const SizedBox(height: 10,),

            //Food Campaign
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(children: [
                // Expanded(flex: 7, child: Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
                // Expanded(flex: 2, child: Text('View all', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, decorationColor: Colors.green, color: Colors.green),))
                Text('Food Campaign', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                Expanded(child: Text(''),),

                Text('View all', style: TextStyle(fontSize: 16, decoration: TextDecoration.underline, decorationColor: Colors.green, color: Colors.green),),
              ],),
            ),
            const SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SizedBox(
                height: 110,
                child: FoodCampaign(),
              ),
            ),
            const SizedBox(height: 10,),





            ],
          ),
        ),
      ),

    );
  }
}
