import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_paginated_list_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/controllers/valley_home_controller.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class InnerNewArrivalsTabViewWidget extends StatelessWidget {
  const InnerNewArrivalsTabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ValleyHomeController>(
        builder: (valleyHomeController) {
          return PaginatedListWidget(
            onPaginate: (int? offset) async {
              await valleyHomeController.getItem();
            },
            // scrollController: _scrollController,
            offset: 1,
            totalSize: valleyHomeController.totalSize,
            builder: (loaderWidget){
              return Flexible(
                child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MasonryGridView.builder(
                        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        mainAxisSpacing: 12, // Space between rows
                        crossAxisSpacing: 12,
                        // shrinkWrap: true,
                        itemCount: valleyHomeController.items.length,
                        itemBuilder: (context, index) {
                          return ProductCardWidget(margin: EdgeInsets.zero, index: index, isBestSeller: true, isHorizontalList: false);
                        },
                      ),
                    ),
                  ),

                  loaderWidget,
                ]),
              );
            },
          );
        }
    );
  }
}
