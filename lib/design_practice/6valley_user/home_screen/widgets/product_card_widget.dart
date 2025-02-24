import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductCardWidget extends StatelessWidget {
  final int? index;
  final double imageHeight;
  final double imageWidth;
  final EdgeInsetsGeometry? margin;
  final String? productImage;
  final bool isBestSeller;
  final bool isNewProduct;
  final bool isHorizontalList;

  const ProductCardWidget({
    super.key,
    this.imageHeight = 150,
    this.imageWidth = 150,
    this.margin,
    this.productImage,
    this.index,
    this.isBestSeller = false,
    this.isNewProduct = false,
    this.isHorizontalList = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.41,
          minHeight: isHorizontalList ? 250 : 0,
      ),


      // padding: margin ?? const EdgeInsets.only(right: 10),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       blurRadius: 6,
      //       color: Colors.black.withValues(alpha: .07),
      //     )
      //   ],
      // ),


      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CustomAssetImageWidget( ((index ?? 3) % 3 == 0) ?
                productImage ??
                Images.girlImage : Images.bagIcon,
                fit: BoxFit.cover,
                height: imageHeight,
                width: double.infinity,
              ),
            ),

            if(((index ?? 3) % 3 == 0) && (isNewProduct || isBestSeller))
              Positioned(
                bottom: isNewProduct ? -15 : -40,
                child: isNewProduct
                    ? const CustomAssetImageWidget(Images.newProduct, height: 50, width: 50)
                    : const CustomAssetImageWidget(Images.bestSeller, height: 100, width: 100),
              ),


            const Positioned(
              right: -8,
              bottom: -8,
              child: CustomAssetImageWidget(
                Images.favoriteIcon,
                height: 50,
                width: 50,
              ),
            ),
          ],
        ),
        const SizedBox(height: Dimensions.paddingSizeSmall),

        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          Text('product_name'.tr,
            style: const TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),

          if((index ?? 3) % 3 == 0)
            Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                Text('rating'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeSmall)),
                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                Text('reviews'.tr, style: TextStyle(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor))
              ]),

              const SizedBox(height: Dimensions.paddingSizeExtraSmall),
            ]),

          Text('product_price'.tr,
            style: const TextStyle(fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w700),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),

          Row(children: [
            Text('discount'.tr,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                  decorationColor: Theme.of(context).hintColor,
                  color: Theme.of(context).hintColor
              ),
            ),
            const SizedBox(width: Dimensions.paddingSizeSmall),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red.withValues(alpha: 0.20), width: 1),
                borderRadius: BorderRadius.circular(5),
                color: Colors.red.withValues(alpha: 0.05),
                // boxShadow: [
                //   BoxShadow(
                //     blurRadius: 6,
                //     color: Colors.black.withValues(alpha: .07),
                //   )
                // ],
              ),
              child: Text('discount_percentage'.tr,
                style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.error),
              ),
            ),

          ]),
        ]),
      ]),
    );
  }
}