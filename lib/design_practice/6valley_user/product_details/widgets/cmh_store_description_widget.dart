import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:flutter_getx/utils/styles.dart';

class CmhStoreDescriptionWidget extends StatelessWidget {
  const CmhStoreDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.sizeOf(context).width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeMedium),
      decoration: BoxDecoration(color: Theme.of(context).cardColor, boxShadow: [
        BoxShadow(
          blurRadius: 15,
          spreadRadius: -3,
          offset: const Offset(0, 3),
          color: context.customThemeColors.textColor.withValues(alpha: 0.05),
        )
      ]),
      child: Column(children: [

        Row(children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  offset: Offset(0, 1),
                  color: Theme.of(context).primaryColor.withValues(alpha: 0.02),
                )
              ]
            ),
            child: const CustomAssetImageWidget(Images.apexIcon, width: 50, fit: BoxFit.cover),
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),

          Text('Apex Store', style: interMedium.copyWith(fontSize: Dimensions.fontSizeSmall)),

          const Spacer(),

          const _VisitStoreWidget()

        ]),
        const SizedBox(height: Dimensions.paddingSizeDefault),

        Row(children: [

          Expanded(
            child: Container(
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).hintColor.withValues(alpha: 0.1), width: 1),
                borderRadius: BorderRadius.circular(Dimensions.paddingEye),
              ),
              child: Row(children: [

                Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Text('5 Star', style: interBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text('Rating', style: interRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)),
                ])),

                Container(height: 40, color: Theme.of(context).primaryColor.withValues(alpha: 0.2), width: 1),

                Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Text('5', style: interBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text('Reviews', style: interRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)),
                ])),

                Container(height: 40, color: Theme.of(context).primaryColor.withValues(alpha: 0.2), width: 1),

                Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                  Text('10k', style: interBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
                  Text('Products', style: interRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)),
                ])),

              ]),
            ),
          ),
          const SizedBox(width: Dimensions.paddingSizeDefault),

          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 1),
            borderRadius: BorderRadius.circular(Dimensions.paddingEye),
          ),
            child: const Center(child: CustomAssetImageWidget(Images.paymentIcon, height: 30, width: 30)),
          ),

        ])
      ]),
    );
  }
}

class _VisitStoreWidget extends StatelessWidget {
  const _VisitStoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('Visit Store', style: interMedium.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor)),
      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
    
      const Icon(Icons.arrow_forward_ios_outlined, size: Dimensions.iconSizeSmall)
    ]);
  }
}
