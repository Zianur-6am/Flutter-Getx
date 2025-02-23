import 'package:flutter/material.dart';
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
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: MasonryGridView.builder(
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  mainAxisSpacing: 12, // Space between rows
                  crossAxisSpacing: 12,
                  itemCount: valleyHomeController.itemCount,
                  itemBuilder: (context, index) {
                    return const ProductCardWidget(margin: EdgeInsets.zero,);
                  },
                ),
              ),

              CircularProgressIndicator(),
            ],
          ),
        );
      }
    );
  }
}
