import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TopStoresCardWidget extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final EdgeInsetsGeometry? margin;
  final int? index;

  const TopStoresCardWidget({
    super.key,
    this.imageHeight = 120,
    this.imageWidth = 120,
    this.margin,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(width: 1, color: Theme.of(context).primaryColor.withValues(alpha: 0.2));
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.58),
      decoration: BoxDecoration(
        border: Border(
          left: borderSide,
          right: borderSide,
          bottom: borderSide,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: context.customThemeColors.textColor.withValues(alpha: .07),
          )
        ],
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CustomAssetImageWidget(Images.topStoryImage, fit: BoxFit.cover, height: 80, width: double.infinity),
            ),
            const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(children: [
                Row(children: [
                  const CustomAssetImageWidget(Images.shopIcon, height: 40, width: 40),
                  const SizedBox(width: Dimensions.paddingEye),

                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('shop_name'.tr),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomAssetImageWidget(Images.starIcon, height: 16, width: 16),
                        const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                        Text('rating'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeDefault))
                      ],
                    ),
                  ]),
                ]),

                Divider(color: Theme.of(context).primaryColor.withValues(alpha: 0.2)),

                Row(children: [

                  const CustomAssetImageWidget(Images.boxIcon),
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                  Text('100_products'.tr, style: TextStyle(color: Theme.of(context).colorScheme.onTertiaryContainer, fontWeight: FontWeight.w500)),

                  const Expanded(child: SizedBox()),

                  Text('reviews'.tr, style: TextStyle(color: Theme.of(context).hintColor),)
                ]),
                const SizedBox(height: 5)
              ]),
            )
          ]),
    );
  }
}