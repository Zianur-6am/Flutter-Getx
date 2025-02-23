import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/images.dart';

class TopStoresCardWidget extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final EdgeInsetsGeometry? margin;
  final int? index;

  const TopStoresCardWidget({
    super.key,
    this.imageHeight = 120,
    this.imageWidth = 120,
    this.margin,
    this.index
  });

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(width: 1, color: Theme.of(context).primaryColor.withValues(alpha: 0.2));
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width * 0.58),
      decoration: BoxDecoration(
        border: Border(
          left: borderSide,
          right: borderSide,
          bottom: borderSide,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withValues(alpha: .07),
          )
        ],
      ),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            const ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: CustomAssetImageWidget(Images.topStoryImage, fit: BoxFit.cover, height: 80, width: double.infinity),
            ),
            const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(children: [
                const Row(children: [
                  CustomAssetImageWidget(Images.shopIcon, height: 40, width: 40),
                  SizedBox(width: 5),

                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Text('Morning Mart'),

                    Row(children: [
                      Icon(Icons.star, color: Colors.orange),
                      SizedBox(width: 5),

                      Text('4.5')
                    ]),
                  ]),
                ]),

                Divider(color: Theme.of(context).hintColor.withValues(alpha: 0.5)),

                const Row(children: [

                  CustomAssetImageWidget(Images.boxIcon),
                  SizedBox(width: 5),

                  Text('100 Products'),

                  Expanded(child: SizedBox()),

                  Text('12, reviews')
                ]),
                const SizedBox(height: 5)
              ]),
            )
          ]),
    );
  }
}