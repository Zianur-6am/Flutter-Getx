import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class WelcomeBannerWidget extends StatelessWidget {
  const WelcomeBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: Dimensions.paddingSizeMedium),

              Text(
                "hello_welcome".tr,
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimensions.fontSizeDefault,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeExtraSmall),

              Text(
                "customer_name".tr,
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: Dimensions.fontSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            child: CustomAssetImageWidget(Images.girlImage, height: 40, width: 40),
          )
        ],
      ),
    );
  }
}
