import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_dashline_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/product_details/controllers/cmh_product_controller.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';

class CmhReviewWidget extends StatelessWidget {
  const CmhReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
        color: Theme.of(context).primaryColor.withValues(alpha: 0.03),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

        Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,children: [

          const CircleAvatar(
            radius: 20,
            child: CustomAssetImageWidget(Images.customerHelenaImage, fit: BoxFit.cover, width: double.infinity, height: double.infinity,),
          ),
          const SizedBox(width: Dimensions.paddingSizeSmall),

          Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text('Helena More', style: interMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: context.customThemeColors.textColor),),

            Row(mainAxisAlignment: MainAxisAlignment.start,children: [
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const SizedBox(width: Dimensions.paddingSizeExtraSmall),

              Text('rating'.tr)
            ])
          ]),

          const Spacer(),

          Text('June 5, 2024', style: interRegular.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor))
        ]),
        const SizedBox(height: Dimensions.paddingSizeSmall),

        Text('Air max are always very comfortable', style: interRegular.copyWith(fontSize: Dimensions.fontSizeSmall)),
        const SizedBox(height: Dimensions.paddingSizeSmall),

        GetBuilder<CmhProductController>(
            builder: (cmhProductController) {
              return SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return SizedBox(
                      width: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.paddingEye),
                        child: CustomAssetImageWidget(cmhProductController.productImages[index]),
                      ),
                    );
                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(width: Dimensions.paddingSizeSmall);
                  },
                  itemCount: cmhProductController.productImages.length,
                ),
              );
            }
        ),

        Row(crossAxisAlignment: CrossAxisAlignment.start,children: [

          const SizedBox(width: Dimensions.paddingSizeSmall),

          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            CustomDashedLineWidget(
              dashCount: 15,
              dashWidth: 3,
              dashHeight: 1,
              axis: Axis.vertical,
              color: Theme.of(context).hintColor,
              spaceBetweenDashes: 2,
            ),

            CustomDashedLineWidget(
              dashCount: 5,
              dashWidth: 3,
              dashHeight: 1,
              axis: Axis.horizontal,
              color: Theme.of(context).hintColor,
              spaceBetweenDashes: 2,
            ),
          ]),

          const SizedBox(width: Dimensions.paddingSizeExtraSmall),

          Expanded(child: Padding(
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall),
            child: Container(
              padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.07), width: 1),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                Row(children: [

                  const CustomAssetImageWidget(Images.replyImage),
                  const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                  Text('Reply by Seller', style: interBold.copyWith(fontSize: Dimensions.fontSizeSmall)),

                  const Spacer(),

                  Text('June 5, 2024', style: interRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall)),
                ]),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                Text('We will try to solve your problem. Thank you', style: interRegular.copyWith(color: Theme.of(context).hintColor, fontSize: Dimensions.fontSizeSmall)),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                GetBuilder<CmhProductController>(
                    builder: (cmhProductController) {
                      return SizedBox(
                        height: 40,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){
                            return SizedBox(
                              width: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(Dimensions.paddingEye),
                                child: CustomAssetImageWidget(cmhProductController.productImages[index]),
                              ),
                            );
                          },
                          separatorBuilder: (context, index){
                            return const SizedBox(width: Dimensions.paddingSizeSmall);
                          },
                          itemCount: cmhProductController.productImages.length,
                        ),
                      );
                    }
                ),
              ]),
            ),
          ))



        ])


      ]),
    );
  }
}
