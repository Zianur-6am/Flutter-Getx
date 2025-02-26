import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ValleyHomeCarouselSliderWidget extends StatefulWidget {
  const ValleyHomeCarouselSliderWidget({super.key});

  @override
  State<ValleyHomeCarouselSliderWidget> createState() => _ValleyHomeCarouselSliderWidgetState();
}

class _ValleyHomeCarouselSliderWidgetState extends State<ValleyHomeCarouselSliderWidget> {
  final List<String> imgList = [
    Images.girlImage,
    Images.blogImage,
    Images.bagIcon,
    Images.laptop,
  ];

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          child: CarouselSlider(
            items: imgList.map((img) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CustomAssetImageWidget(img, fit: BoxFit.cover, height: double.infinity, width: double.infinity),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                        gradient: LinearGradient(colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).primaryColor,
                          const Color(0xFF4E0FD3)
                        ])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSizeSmall,
                          vertical: 2,
                        ),
                        child: Row(
                          children: [
                            Text('shop_now'.tr, style: TextStyle(
                              color: Theme.of(context).cardColor,
                              fontSize: Dimensions.fontSizeExtraSmall,
                            )),
                            const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                            
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: Dimensions.iconSizeExtraSmall,
                              color: Theme.of(context).cardColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            }).toList(),
            options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                aspectRatio: 2.5,
                onPageChanged: (index, reason) {
                  setState(() => _current = index);
                }
            ),
          ),
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return Container(
              width: 5,
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == entry.key
                    ? Colors.blue
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
