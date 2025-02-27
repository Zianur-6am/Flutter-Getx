import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/common/basewidgets/sliver_header_delegate.dart';
import 'package:flutter_getx/common/enum/cmh_product_description_tabbar_enum.dart';
import 'package:flutter_getx/design_practice/6valley_user/product_details/widgets/cmh_product_details_carousel_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/get_utils.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> with TickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();

  final double _flexibleSpaceHeight = 375; // Height of the flexibleSpace
  bool _isFlexibleSpaceVisible = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController.addListener(_onScroll);

  }

  void _onScroll() {
    final double scrollOffset = _scrollController.offset;
    final bool isVisible = scrollOffset < (_flexibleSpaceHeight - 55);

    // Update the state if the visibility changes
    if (isVisible != _isFlexibleSpaceVisible) {
      setState(() {
        _isFlexibleSpaceVisible = isVisible;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
          headerSliverBuilder: (context, _) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                automaticallyImplyLeading: false,
                title: Text(_isFlexibleSpaceVisible ? '' : 'product_name'.tr, style: const TextStyle(
                    fontSize: Dimensions.fontSizeSmall,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis
                )),
                flexibleSpace: const FlexibleSpaceBar(
                  background: CmhProductDetailsCarouselSliderWidget(),
                  collapseMode: CollapseMode.pin,
                  expandedTitleScale: 1,
                ),
                expandedHeight: _flexibleSpaceHeight,
                leading: const _LeadingIcon(),
                actions: const [
                  _FavoriteIcon(),
                  SizedBox(width: Dimensions.paddingSizeExtraSmall),

                  _ShareIcon(),
                  SizedBox(width: 10),
                ],

                backgroundColor: _isFlexibleSpaceVisible ? Colors.transparent : Theme.of(context).colorScheme.onPrimary,
              ),



            ];
          },
          body: Column(children: [
            
            const _PriceSection(),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                const SizedBox(height: Dimensions.paddingSizeSmall),

                Text(
                  'product_name'.tr,
                  style: const TextStyle(
                    fontSize: Dimensions.fontSizeDefault,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: Dimensions.paddingSizeSmall),

                Divider(color: Theme.of(context).primaryColor.withValues(alpha: 0.1)),
                const SizedBox(height: Dimensions.paddingSizeSmall),

                Row(children: [

                  Expanded(
                    flex: 1,
                    child: Row(children: [
                      const Icon(Icons.star, size: Dimensions.iconSizeSmall, color: Colors.orange),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                      Text('rating'.tr, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeSmall)),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                      Text('(9.2k+ Rev)', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.fontSizeSmall,
                          color: Theme.of(context).hintColor
                      )),
                    ]),
                  ),


                  Container(height: 15, width: 1, color: Theme.of(context).hintColor),

                  Expanded(
                    flex: 1,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      const Text('22.5k+', style: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeSmall)),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                      Text('Orders', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.fontSizeSmall,
                          color: Theme.of(context).hintColor
                      )),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    ]),
                  ),

                  Container(height: 15, width: 1, color: Theme.of(context).hintColor),

                  Expanded(
                    flex: 1,
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text('120', style: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeSmall)),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),

                      Text('Wish Listed', style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Dimensions.fontSizeSmall,
                          color: Theme.of(context).hintColor
                      )),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                    ]),
                  ),

                ]),
                const SizedBox(height: Dimensions.paddingSizeSmall),

                Divider(color: Theme.of(context).primaryColor.withValues(alpha: 0.1)),
                const SizedBox(height: Dimensions.paddingSizeSmall),

                Text('available_in'.tr, style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: Dimensions.fontSizeSmall,
                  fontWeight: FontWeight.w600
                )),

                Row(children: [
                  Text('color'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w500),)
                ]),


              ]),
            )

          ]),
    ));
  }
}

class _LeadingIcon extends StatelessWidget {
  const _LeadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimensions.paddingEye),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(0, 10),
              color: context.customThemeColors.textColor.withValues(alpha: 0.1),
            )
          ],
        ),
        child: const Padding(
          padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
          child: Center(child: CustomAssetImageWidget(Images.backIcon)),
        ),
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
            spreadRadius: 2,
            offset: const Offset(0, 10),
            color: context.customThemeColors.textColor.withValues(alpha: 0.1),
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Center(child: Icon(Icons.favorite, color: Colors.red, size: Dimensions.iconSizeMedium)),
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
            spreadRadius: 2,
            offset: const Offset(0, 10),
            color: context.customThemeColors.textColor.withValues(alpha: 0.1),
          )
        ],
      ),
      child: const Padding(
        padding: EdgeInsets.all(Dimensions.paddingSizeSmall),
        child: Center(child: CustomAssetImageWidget(Images.shareIcon)),
      ),
    );
  }
}


class _PriceSection extends StatelessWidget {
  const _PriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -10, 0),
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeMedium),
      color: Theme.of(context).primaryColor.withValues(alpha: 0.125),
      child: Row(children: [

        Flexible(
          flex: 4,
          child: Text('product_price'.tr,
            style: const TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),

        Flexible(
          flex: 4,
          child: Text('discount'.tr,
            style: TextStyle(
                fontSize: Dimensions.fontSizeSmall,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough,
                decorationColor: Theme.of(context).hintColor,
                color: Theme.of(context).hintColor
            ),
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),

        Flexible(
          flex: 1,
          child: Container(
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
        ),

      ]),
    );
  }
}
