import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_grid_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/get_utils.dart';

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
    final double topSpace = MediaQuery.of(context).padding.top + 12;
    return Column(
      children: [

        SizedBox(height: topSpace),

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
        
        const _PriceSection()
      ],
    );
  }
}

class _PriceSection extends StatelessWidget {
  const _PriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -10, 0),
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeMedium),
      color: Theme.of(context).primaryColor.withValues(alpha: 0.125),
      child: Row(children: [
    
        Flexible(
          flex: 4,
          child: Text('product_price'.tr,
            style: const TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),
    
        Flexible(
          flex: 4,
          child: Text('discount'.tr,
            style: TextStyle(
                fontSize: Dimensions.fontSizeSmall,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough,
                decorationColor: Theme.of(context).hintColor,
                color: Theme.of(context).hintColor
            ),
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),
    
        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.30), width: 1),
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.error.withValues(alpha: 0.05),
            ),
            child: Text('discount_percentage'.tr,
              style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
    
      ]),
    );
  }
}
