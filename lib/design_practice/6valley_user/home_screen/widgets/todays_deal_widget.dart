import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TodayDealWidget extends StatelessWidget {
  const TodayDealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [


            Padding(
              padding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraSmall),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CustomAssetImageWidget(
                  Images.todayDealImage,
                  height: widthSize * 0.70,
                  width: widthSize * 0.35,
                  fit: BoxFit.cover,
                ),
              ),
            ),


            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: Dimensions.paddingSizeExtraSmall),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          child: CustomAssetImageWidget(
                            Images.bagIcon,
                            fit: BoxFit.cover,
                            height: widthSize * 0.55,
                            width: double.infinity,
                          ),
                        ),

                        Positioned(
                          right: 5,
                          bottom: 5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).cardColor,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0,0),
                                  blurRadius: 17.39,
                                  spreadRadius: 0,
                                  color: Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.06),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                              child: Icon(
                                Icons.favorite_outlined, color: Theme.of(context).colorScheme.error,
                                size: Dimensions.iconSizeDefault,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                      const RatingSectionWidget(),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                      Text('product_name'.tr,
                        style: const TextStyle(fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w500),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                      Text('product_price'.tr,
                        style: const TextStyle(fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w700),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                      const DiscountSectionWidget(),

                    ]),
              ),
            ),

          ]),
    );
  }
}

class RatingSectionWidget extends StatelessWidget {
  const RatingSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAssetImageWidget(Images.starIcon, height: Dimensions.fontSizeExtraLarge, width: Dimensions.fontSizeExtraLarge),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),

          Text('rating'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeDefault)),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),

          Text('(${'reviews'.tr})', style: TextStyle(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor))
        ],
      ),
                  
      Row(children: [
                  
        const CustomAssetImageWidget(Images.boxIcon, height: Dimensions.fontSizeExtraLarge, width: Dimensions.fontSizeExtraLarge),
        const SizedBox(width: Dimensions.paddingSizeExtraSmall),

        Text('items_left'.tr, style: TextStyle(
            color: Theme.of(context).colorScheme.onTertiaryContainer,
            fontSize: Dimensions.fontSizeSmall,
            fontWeight: FontWeight.w500
        )),
      ]),
                  
    ]);
  }
}

class DiscountSectionWidget extends StatelessWidget {
  const DiscountSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Row(children: [
          Text('discount'.tr,
            style: TextStyle(
                fontSize: Dimensions.fontSizeExtraSmall,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough,
                decorationColor: Theme.of(context).hintColor,
                color: Theme.of(context).hintColor
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red.withValues(alpha: 0.20), width: 1),
              borderRadius: BorderRadius.circular(5),
              color: Colors.red.withValues(alpha: 0.05),
            ),
            child: Text('discount_percentage'.tr,
              style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.error),
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),
        ]),

        const CustomAssetImageWidget(Images.plusIcon, height: Dimensions.iconSizeExtraLarge, width: Dimensions.iconSizeExtraLarge, fit: BoxFit.cover),

      ],
    );
  }
}
