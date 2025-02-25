import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_paginated_list_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/controllers/valley_home_controller.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_grid_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class InnerNewArrivalsTabViewWidget extends StatelessWidget {
  const InnerNewArrivalsTabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandScapeMode = MediaQuery.of(context).orientation == Orientation.landscape;
    return GetBuilder<ValleyHomeController>(
        builder: (valleyHomeController) {
          return PaginatedListWidget(
            onPaginate: (int? offset) async {
              await valleyHomeController.getItem();
            },
            offset: 1,
            totalSize: valleyHomeController.totalSize,
            builder: (loaderWidget){
              return Expanded(
                child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: MasonryGridView.builder(
                        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isLandScapeMode ? 3 : 2 ,
                        ),
                        mainAxisSpacing: 15, // Space between rows
                        crossAxisSpacing: 10,
                        // shrinkWrap: true,
                        itemCount: valleyHomeController.items.length,
                        itemBuilder: (context, index) {
                          return ProductCardGridWidget(
                            margin: EdgeInsets.zero,
                            index: index,
                          );
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
