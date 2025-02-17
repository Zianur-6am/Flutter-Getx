import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/controllers/AddProductController.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';

class AddProductTitleBar extends StatelessWidget {
  AddProductTitleBar({super.key});
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AddProductController>(
        builder : (addProductController){
        return SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingEye),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: addProductController.pages.length,
              itemBuilder: (BuildContext context, int index) {
                return  Container(
                  margin: const EdgeInsets.only(right: Dimensions.paddingSizeMedium),
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingEye),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radiusSmall),
                      border: Border.all(color: addProductController.selectedPageIndex == index ? Theme.of(context).primaryColor : Colors.transparent),
                      color: addProductController.selectedPageIndex == index ? Theme.of(context).primaryColor.withValues(alpha:0.06) : Colors.transparent
                  ),
                  child: Center(
                    child: Text(addProductController.pages[index],
                      style: robotoRegular.copyWith(color: addProductController.selectedPageIndex == index ? Theme.of(context).primaryColor: Theme.of(context).hintColor),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }
}
