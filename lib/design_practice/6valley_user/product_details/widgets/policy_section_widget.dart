import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:flutter_getx/utils/styles.dart';

class PolicySectionWidget extends StatelessWidget {
  const PolicySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeSmall),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            spreadRadius: -3,
            offset: const Offset(0, 3),
            color: context.customThemeColors.textColor.withValues(alpha: 0.05),
          )
        ]
      ),
      child: const Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [

        _PolicyElementWidget(elementImage: Images.returnIcon, elementText: '7 Days easy Return'),

        _PolicyElementWidget(elementImage: Images.paymentIcon, elementText: 'Safe Payment'),

        _PolicyElementWidget(elementImage: Images.authenticIcon, elementText: '100% Authentic Products'),


      ]),
    );
  }
}

class _PolicyElementWidget extends StatelessWidget {
  final String elementImage;
  final String elementText;
  const _PolicyElementWidget({
    super.key, required this.elementImage, required this.elementText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomAssetImageWidget(elementImage, width: 30, height: 30,),
            const SizedBox(height: Dimensions.paddingSizeDefault),

            Text(elementText, style: interRegular.copyWith(fontSize: Dimensions.fontSizeSmall), textAlign: TextAlign.center),
          ]),
    );
  }
}
