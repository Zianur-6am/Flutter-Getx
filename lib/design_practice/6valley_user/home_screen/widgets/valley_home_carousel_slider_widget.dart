import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/utils/images.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CarouselSlider(
            items: imgList.map((img) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CustomAssetImageWidget(img, fit: BoxFit.cover, width: double.infinity),
                ),
              );
            }).toList(),
            options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: true,
                aspectRatio: 2,
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
