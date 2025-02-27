import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_image_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/valley_home_carousel_slider_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/product_details/widgets/cmh_product_details_carousel_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              const SliverAppBar(
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                leadingWidth: 0,
                title: Row(
                  children: [
                    _LeadingIcon(),
                    SizedBox(width: Dimensions.paddingSizeMedium),

                    Text('Product name', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                  ],
                ),
                actions: [
                  _FavoriteIcon(),
                  SizedBox(width: Dimensions.paddingSizeExtraSmall),

                  _ShareIcon(),
                  SizedBox(width: 10),
                ],
                backgroundColor: Colors.transparent,
              ),

              const SliverToBoxAdapter(
                child: CmhProductDetailsCarouselSliderWidget(),
              ),


            ];
          },
          body: const SizedBox(),
    ));
  }
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 10),
            color: context.customThemeColors.textColor.withValues(alpha: 0.1),
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Icon(Icons.arrow_back_ios, size: Dimensions.iconSizeMedium),
      ),
    );
  }
}

class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).cardColor,
        border: Border.all(color: Colors.red.withValues(alpha: 0.4), width: 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 10),
            color: context.customThemeColors.textColor.withValues(alpha: 0.1),
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Icon(Icons.favorite, color: Colors.red, size: Dimensions.iconSizeMedium),
      ),
    );
  }
}

class _ShareIcon extends StatelessWidget {
  const _ShareIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).primaryColor.withValues(alpha: 0.2), width: 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(0, 10),
            color: context.customThemeColors.textColor.withValues(alpha: 0.1),
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: CustomAssetImageWidget(Images.shareIcon),
      ),
    );
  }
}
