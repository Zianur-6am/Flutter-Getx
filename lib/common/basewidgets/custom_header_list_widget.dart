import 'package:flutter/material.dart';
import 'package:flutter_getx/utils/dimensions.dart';

class CustomHeaderListWidget extends StatelessWidget {
  final String headerText;
  final Color backgroundColor;
  final List<String> items;
  final bool isHorizontal;
  final double itemHeight;
  final double itemWidth;
  final double verticalPadding;
  final double horizontalPadding;
  final TextStyle? headerTextStyle;

  const CustomHeaderListWidget({
    super.key,
    required this.headerText,
    required this.backgroundColor,
    required this.items,
    this.isHorizontal = false,
    this.itemHeight = 60,
    this.itemWidth = 120,
    this.verticalPadding = 10,
    this.horizontalPadding = 15,
    this.headerTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedSliver(
      decoration: BoxDecoration(
        color: backgroundColor
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
              return Container(
                // margin: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  items[index],
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              );
            },
            childCount: items.length,
          ),
        ),
      ]),
    );
  }
}
