import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';

class CmhProductDetailsCarouselSliderWidget extends StatefulWidget {
  const CmhProductDetailsCarouselSliderWidget({super.key});

  @override
  State<CmhProductDetailsCarouselSliderWidget> createState() => _CmhProductDetailsCarouselSliderWidgetState();
}

class _CmhProductDetailsCarouselSliderWidgetState extends State<CmhProductDetailsCarouselSliderWidget> {
  
  CarouselSliderController carouselController = CarouselSliderController();
  
  final List<String> imgList = [
    Images.girlImage,
    Images.laptop,
    Images.blogImage,
    // Images.laptop,
    // Images.bagIcon,
    // Images.laptop,
    // Images.laptop,
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          items: imgList.map((img) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CustomAssetImageWidget(img, fit: BoxFit.cover, height: double.infinity, width: double.infinity),
            );
          }).toList(),
          options: CarouselOptions(
            height: 300,
              enlargeCenterPage: true,
              viewportFraction: 0.8,
              autoPlay: true,
              aspectRatio: 1,
              onPageChanged: (index, reason) {
                setState(() => _current = index);
              }
          ),
        ),

        Container(
          constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.7,  maxHeight: MediaQuery.sizeOf(context).width * 0.15),
          width: double.parse((57 * imgList.length).toString()),
          transform: Matrix4.translationValues(0, -25, 0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: context.customThemeColors.textColor.withValues(alpha: 0.1),
                  blurRadius: 20,
                )
              ]
          ),
          padding: const EdgeInsets.only(left: Dimensions.paddingSizeExtraSmall, top: Dimensions.paddingSizeExtraSmall, bottom: Dimensions.paddingSizeExtraSmall),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imgList.length,
            itemBuilder: (context, index){
              return InkWell(
                onTap: () => carouselController.jumpToPage(index),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 1, color: _current == index ? Theme.of(context).primaryColor : Colors.transparent)
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: CustomAssetImageWidget(imgList[index], fit: BoxFit.cover,),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
