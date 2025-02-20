import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';

class CustomHeaderSliverListWidget extends StatelessWidget {
  final String headerText;
  final Color? backgroundColor;
  final List<String> items;
  final bool isHorizontal;
  final double itemHeight;
  final double itemWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final TextStyle? headerTextStyle;

  const CustomHeaderSliverListWidget({
    super.key,
    required this.headerText,
    required this.items,
    this.isHorizontal = false,
    this.itemHeight = 60,
    this.itemWidth = 120,
    this.verticalPadding = 10,
    this.horizontalPadding = 15,
    this.headerTextStyle,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedSliver(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).cardColor
      ),
      sliver: SliverMainAxisGroup( slivers: [

        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
            // color: backgroundColor,
            child: Text(
              headerText,
              style: headerTextStyle ?? TextStyle(
                  fontSize: Dimensions.fontSizeDefault,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
              ),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return const ProductCardWidget();
            },
            childCount: items.length,
          ),
        ),
      ]),
    );
  }
}
