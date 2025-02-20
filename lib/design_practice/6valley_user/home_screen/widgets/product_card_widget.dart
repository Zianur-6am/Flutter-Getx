import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';

class ProductCardWidget extends StatelessWidget {
  final double imageHeight;
  final double imageWeight;

  const ProductCardWidget({
    super.key,
    this.imageHeight = 120,
    this.imageWeight = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.35),
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withValues(alpha: .07),
          )
        ],
      ),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Stack(children: [
          
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
              child: CustomAssetImageWidget(Images.laptop, fit: BoxFit.cover, height: 120, width: double.infinity)),

          Positioned(
            bottom: 5,
            right: 5,
            child: CustomAssetImageWidget(Images.favoriteIcon),
          ),
        ]),

        LayoutBuilder(builder: (context, boxConstraint){
        return const Column(children: [
            Text('Top Benefits of Using a POS System sdfds sdf sd fd sd s s dds fsda  sf',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: Dimensions.paddingSizeSmall),

            Text('TK 3237.87', maxLines: 1, overflow: TextOverflow.ellipsis),

            Row(children: [
              Text('1100',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, decoration: TextDecoration.lineThrough),
              ),
              SizedBox(height: Dimensions.paddingSizeSmall),

              Text('-10%',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.red),
              ),
            ]),
          ]);
        }),
      ]),
    );
  }
}