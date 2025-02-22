import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';

class ProductCardWidget extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final EdgeInsetsGeometry? margin;
  final String? productImage;

  const ProductCardWidget({
    super.key,
    this.imageHeight = 150,
    this.imageWidth = 150,
    this.margin,
    this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.41),
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
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: CustomAssetImageWidget(
                productImage ??
                Images.girlImage,
                fit: BoxFit.cover,
                height: imageHeight,
                width: double.infinity,
              ),
            ),

            // Position the favorite icon directly
            const Positioned(
              right: -8,    // Adjust padding from right
              bottom: -8,    // Adjust padding from bottom
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
          const Text('Top Benefits of Using a POS System sdfds sdf sd fd sd s s dds fsda  sf',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Dimensions.paddingSizeSmall),

          const Text('TK 3237.87',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: Dimensions.paddingSizeSmall),

          Row(children: [
            const Text('1100',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough),
            ),
            SizedBox(width: Dimensions.paddingSizeSmall),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
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
              child: const Text('-10%',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
              ),
            ),

          ]),
        ]),
      ]),
    );
  }
}