import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class InnerNewArrivalsTabViewWidget extends StatelessWidget {
  const InnerNewArrivalsTabViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: MasonryGridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        mainAxisSpacing: 12, // Space between rows
        crossAxisSpacing: 12,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const ProductCardWidget(margin: EdgeInsets.zero,);
        },
      ),
    );
  }
}
