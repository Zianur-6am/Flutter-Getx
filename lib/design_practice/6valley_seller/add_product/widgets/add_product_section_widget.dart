import 'package:flutter/material.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';


class AddProductSectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> childrens;
  final TextStyle? titleStyle;
  final bool isDecoration;
  const AddProductSectionWidget({super.key, required this.title, required this.childrens, this.titleStyle, this.isDecoration = true});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall, horizontal: Dimensions.fontSizeExtraLarge),
          child: Text(title, style: titleStyle ?? interBold.copyWith(fontSize: Dimensions.fontSizeLarge))),

        Container(
          decoration: isDecoration ? BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D1B7FED), // 0x0D is the hex value for 5% opacity
                  offset: Offset(0, 6),
                  blurRadius: 12,
                  spreadRadius: -3,
                ),
                BoxShadow(
                  color: Color(0x0D1B7FED), // 0x0D is the hex value for 5% opacity
                  offset: Offset(0, -6),
                  blurRadius: 12,
                  spreadRadius: -3,
                ),
              ]
          ) : null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: childrens,
          ),
        ),
      ],
    );
  }
}
