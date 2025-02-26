import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_image_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/domain/models/product_model.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductCardGridWidget extends StatelessWidget {
  final Product? product;


  const ProductCardGridWidget({
    super.key,
    required this.product,

  });

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, boxConstraints) {
        return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: CustomImageWidget(
                      height: boxConstraints.maxWidth,
                      image: '${product?.thumbnailFullUrl?.path}',
                      fit: BoxFit.fitHeight,
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    left: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radiusDefault)
                        ),
                        gradient: LinearGradient(colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor,
                          Colors.deepPurple
                        ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeSmall,
                          vertical: 2,
                        ),
                        child: Text('best_selling'.tr, style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontSize: Dimensions.fontSizeExtraSmall,
                        )),
                      ),
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
                          size: Dimensions.iconSizeSmall,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Text(product?.name ?? 'product_name'.tr,
                style: const TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),


                // const RatingSectionWidget(),


              Column(mainAxisSize: MainAxisSize.min, children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CustomAssetImageWidget(Images.starIcon, height: Dimensions.iconSizeSmall, width: Dimensions.iconSizeSmall),
                    const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                    Text('rating'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeDefault)),

                    if(product?.reviewsCount != null) ...[
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                      Expanded(
                        child: Text("(${product?.reviewsCount} review",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Theme.of(context).hintColor,
                            fontSize: Dimensions.fontSizeSmall,
                          )),
                      ),
                    ]

                  ],
                ),

                const SizedBox(height: Dimensions.paddingSizeExtraSmall),

              ]),

              Text('product_price'.tr,
                style: const TextStyle(fontSize: Dimensions.fontSizeDefault, fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),

              const DiscountSectionWidget(),
            ]);
      }
    );
  }
}

class DiscountSectionWidget extends StatelessWidget {
  const DiscountSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text('discount'.tr,
        style: TextStyle(
            fontSize: Dimensions.fontSizeSmall,
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
          border: Border.all(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.30), width: 1),
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.05),
        ),
        child: Text('discount_percentage'.tr,
          style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.error),
        ),
      ),

    ]);
  }
}

class RatingSectionWidget extends StatelessWidget {
  const RatingSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAssetImageWidget(Images.starIcon, height: Dimensions.iconSizeSmall, width: Dimensions.iconSizeSmall),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),

          Text('rating'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeDefault)),

        ],
      ),

      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

    ]);
  }
}