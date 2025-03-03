import 'package:flutter/material.dart';

class CustomDashedLineWidget extends StatelessWidget {
  final int dashCount;
  final double dashWidth;
  final double dashHeight;
  final double spaceBetweenDashes;
  final Color color;
  final Axis axis;

  const CustomDashedLineWidget({
    super.key,
    required this.dashCount,
    this.dashWidth = 10,
    this.dashHeight = 2,
    this.spaceBetweenDashes = 5,
    this.color = Colors.black,
    this.axis = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(dashCount, (index) {
        return Padding(
          padding: EdgeInsets.only(
            right: axis == Axis.horizontal ? spaceBetweenDashes : 0,
            bottom: axis == Axis.vertical ? spaceBetweenDashes : 0,
          ),
          child: Container(
            width: axis == Axis.horizontal ? dashWidth : dashHeight,
            height: axis == Axis.horizontal ? dashHeight : dashWidth,
            color: color,
          ),
        );
      }),
    );
  }
}
