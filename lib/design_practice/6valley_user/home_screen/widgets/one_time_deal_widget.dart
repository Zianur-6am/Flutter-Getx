import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class OneTimeDealWidget extends StatelessWidget {
  final Color? backgroundColor;
  const OneTimeDealWidget({super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
      child: Column(mainAxisSize: MainAxisSize.min,children: [

        const HeaderSectionWidget(),
        const SizedBox(height: Dimensions.paddingSizeSmall),

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
                child: ProductCardWidget(index: index),
              );
            },
          ),
        )
      ]),
    );
  }
}


class HeaderSectionWidget extends StatelessWidget {
  const HeaderSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [

      Row(children: [

        Text('one_time_deal'.tr, style: TextStyle(
            fontSize: Dimensions.fontSizeDefault,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w700
        )),
        const SizedBox(width: Dimensions.paddingSizeSmall),


        Stack(clipBehavior: Clip.none, alignment: AlignmentDirectional.center, children: [

          Center(child: Image.asset(Images.flashIcon, height: Dimensions.iconSizeExtraLarge)),

          Positioned(child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeSmall),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: Dimensions.paddingSizeExtraSmall,
            ),
            child: Text("up_to_20".tr, style: TextStyle(
                fontSize: Dimensions.fontSizeExtraSmall,
                color: Theme.of(context).cardColor
            )),
          ),),

        ]),

      ],),


      DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingSizeExtraSmall)),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
          child: Row(mainAxisSize: MainAxisSize.min, children: [

            Text("ends_in".tr, style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Dimensions.fontSizeExtraSmall,
            ),),

            Text("06: 02: 04: 08", style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Dimensions.fontSizeSmall,
            ),),

          ]),
        ),
      ),


    ],);
  }
}
