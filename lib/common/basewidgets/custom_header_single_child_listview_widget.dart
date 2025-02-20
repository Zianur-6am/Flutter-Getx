import 'package:flutter/material.dart';

class CustomHeaderSingleChildListViewWidget extends StatelessWidget {
  final int itemCount;
  final Color? backgroundColor;
  final IndexedWidgetBuilder itemBuilder;
  final double itemSpacing;
  final bool directionVertical;
  final double verticalPadding;
  final double horizontalPadding;
  final Widget headerWidget;


  const CustomHeaderSingleChildListViewWidget({
    super.key,  // Optional Key parameter
    required this.itemCount,
    required this.itemBuilder,
    this.itemSpacing = 8.0,
    this.directionVertical = true, this.verticalPadding = 10,  
    this.horizontalPadding = 10, 
    required this.headerWidget,
    this.backgroundColor, // Default spacing between items
  });  // Passing the key to the parent constructor

  @override
  Widget build(BuildContext context) {
    if (itemCount >= 1000) {
      debugPrint(
        'Warning: The itemCount is greater than 1000. For large lists, use ListView instead for better performance.',
      );
    }
    return Container(
      color: backgroundColor ?? Theme.of(context).cardColor,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          headerWidget,

          Flexible(
            child: SingleChildScrollView(
              scrollDirection: directionVertical ? Axis.vertical : Axis.horizontal,
              child: directionVertical
                  ? Column(children: List.generate(itemCount, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: itemSpacing),
                  child: itemBuilder(context, index),
                );
              }))
                  : Row(children: List.generate(itemCount, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: itemSpacing),
                  child: itemBuilder(context, index),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
