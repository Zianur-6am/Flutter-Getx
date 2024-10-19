import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/Food_Delivery_App_Design/features/home/controllers/banner_controller.dart';
import 'package:get/get.dart';

class Banners extends StatelessWidget {
  BannerController bannerController = Get.find();

  @override
  Widget build(BuildContext context) {
    // print('====================================>>>>>>>${bannerController.bannerList.length}');
    return GetBuilder(builder: (BannerController bannerController) {
      return Column(
        children: [
          CarouselSlider(
            //items to be shown are mapped one by one into ui and it takes list***
            items: bannerController.bannerList
                .map((banner) => Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: banner.imageFullUrl.toString(),
                  placeholder: (context, url) =>
                  new CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                  new Icon(Icons.error),
                ),
              ),
            ))
                .toList(),
            options: CarouselOptions(
              aspectRatio: 2.5,
               viewportFraction: 0.8,
                initialPage: 0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                onPageChanged: (value, _) {
                  bannerController.updatePageNumber(value);
                }),
          ),
          buildCarouselIndicator(),
        ],
      );
    });
  }

  buildCarouselIndicator() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < bannerController.bannerList.length; i++)
            Container(
              height: bannerController.currentPage == i ? 7 : 5,
              width: bannerController.currentPage == i ? 7 : 5,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: bannerController.currentPage == i
                      ? Colors.black
                      : Colors.grey,
                  shape: BoxShape.circle),
            )
        ],
      ),
    );
  }
}
