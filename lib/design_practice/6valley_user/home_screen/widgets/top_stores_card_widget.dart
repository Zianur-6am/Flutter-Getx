import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class TopStoresCardWidget extends StatelessWidget {
  final int? index;

  const TopStoresCardWidget({
    super.key,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: CustomAssetImageWidget(Images.topStoryImage, fit: BoxFit.cover, height: 80, width: double.infinity),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Theme.of(context).primaryColor.withValues(alpha: 0.2)),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                  color: Theme.of(context).cardColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      color: context.customThemeColors.textColor.withValues(alpha: .07),
                    )
                  ],
                ),
                child: Column(children: [
                  const SizedBox(height: 5),

                  Row(children: [
                    const CustomAssetImageWidget(Images.shopIcon, height: Dimensions.logoHeight, width: Dimensions.logoHeight),
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
            ]);
      }
    );
  }
}