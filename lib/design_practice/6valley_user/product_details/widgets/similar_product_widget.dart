import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_paginated_list_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/controllers/valley_home_controller.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_grid_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SimilarProductWidget extends StatelessWidget {
  const SimilarProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    final bool isLandScapeMode = MediaQuery.of(context).orientation == Orientation.landscape;

    return GetBuilder<ValleyHomeController>(
        builder: (valleyHomeController) {
          return Padding(
            padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

              Text('Similar Products', style: interBold.copyWith(fontSize: Dimensions.fontSizeLarge)),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              MasonryGridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isLandScapeMode ? 3 : 2,
                ),
                mainAxisSpacing: Dimensions.paddingSizeMedium, // Space between rows
                crossAxisSpacing: Dimensions.paddingSizeSmall,
                itemCount: valleyHomeController.itemCount,
                itemBuilder: (context, index) {
                  return ProductCardWidget(index: index);
                },
              ),
            ]),
          );
        }
    );
  }
}
