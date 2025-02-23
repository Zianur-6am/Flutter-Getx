import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';

class TodayDealWidget extends StatelessWidget {
  const TodayDealWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).hintColor.withValues(alpha: 0.05),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withValues(alpha: .07),
          )
        ],
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CustomAssetImageWidget(
                Images.todayDealImage,
                height: 250,
                width: MediaQuery.sizeOf(context).width * 0.3,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: CustomAssetImageWidget(
                            Images.bagIcon,
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),

                        Positioned(
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
                    const SizedBox(height: 5),

                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                      Row(children: [
                        const Icon(Icons.star, color: Colors.orange, size: 16),
                        const SizedBox(width: 5),

                        const Text('4.5', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 5,),

                        Text('(12 reviews)', style: TextStyle(fontSize: 12, color: Theme.of(context).hintColor))
                      ]),

                      const Row(children: [

                        CustomAssetImageWidget(Images.boxIcon),
                        SizedBox(width: 5),

                        Text('Item left'),
                      ]),

                    ]),

                    const Text('TK 3237.87',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  ]),
            ),

          ]),
    );
  }
}
