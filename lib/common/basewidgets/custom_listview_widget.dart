import 'package:flutter/material.dart';

class CustomListViewWidget extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double itemSpacing;
  final bool directionVertical;


  const CustomListViewWidget({
    super.key,  // Optional Key parameter
    required this.itemCount,
    required this.itemBuilder,
    this.itemSpacing = 8.0,
    this.directionVertical = true, // Default spacing between items
  });  // Passing the key to the parent constructor

  @override
  Widget build(BuildContext context) {
    if (itemCount >= 1000) {
      debugPrint(
        'Warning: The itemCount is greater than 1000. For large lists, use ListView instead for better performance.',
      );
    }
    return SingleChildScrollView(
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
    );
  }
}
