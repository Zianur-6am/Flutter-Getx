import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class NewUserExclusiveSectionWidget extends StatelessWidget {
  final Color? backgroundColor;
  const NewUserExclusiveSectionWidget({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(

      color: backgroundColor ?? Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
      child: Column(mainAxisSize: MainAxisSize.min,children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'new_user_exclusive'.tr,
              style: const TextStyle(
                  fontWeight: FontWeight.w700, fontSize: Dimensions.fontSizeDefault),
            ),
            Text(
              'view_all'.tr,
              style: const TextStyle(fontSize: Dimensions.fontSizeSmall),
            )
          ],
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 260,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(width: Dimensions.paddingSizeSmall);
            },
            itemCount: 10,
            itemBuilder: (context, index){
              return SizedBox(
                width: 150,
                child: ProductCardWidget(index: index,),
              );
            },
          ),
        )


      ]),
    );
  }
}
