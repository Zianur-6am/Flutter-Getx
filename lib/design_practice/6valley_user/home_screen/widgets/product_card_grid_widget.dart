import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductCardGridWidget extends StatelessWidget {
  final int? index;
  final EdgeInsetsGeometry? margin;
  final String? productImage;

  const ProductCardGridWidget({
    super.key,
    this.margin,
    this.productImage,
    this.index,

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
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radiusSmall),
                        topRight: Radius.circular(Dimensions.radiusSmall),
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(Dimensions.radiusSmall)),
                    child: CustomAssetImageWidget( ((index ?? 3) % 3 == 0) ?
                    productImage ??
                        Images.girlImage : Images.bagIcon,
                      fit: BoxFit.cover,
                      height: boxConstraints.maxWidth,
                      width: boxConstraints.maxWidth,
                    ),
                  ),

                  if(((index ?? 3) % 3 == 0))
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomLeft,
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
                            fontSize: Dimensions.paddingSizeSmall,
                          )),
                        ),
                      ),
                    ),
                  ),


                  Positioned(
                    right: 5,
                    bottom: 8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).cardColor,
                        border: Border.all(
                          color: Theme.of(context).primaryColorLight.withOpacity(0.5),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0,0),
                            blurRadius: 17.39,
                            spreadRadius: 0,
                            color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.06),
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

              Text('product_name'.tr,
                style: const TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),

              if((index ?? 3) % 3 == 0)
                const RatingSectionWidget(),

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
          border: Border.all(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.30), width: 1),
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.05),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAssetImageWidget(Images.starIcon, height: 16, width: 16),
          const SizedBox(width: Dimensions.paddingSizeExtraSmall),

          Text('rating'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeDefault)),

        ],
      ),

      const SizedBox(height: Dimensions.paddingSizeExtraSmall),

    ]);
  }
}