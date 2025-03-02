import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/drop_down_decorator_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/controllers/AddProductController.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/domain/models/product_model.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';

class SelectCategoryWidget extends StatefulWidget {
  final Product? product;
  const SelectCategoryWidget({super.key, required this.product});

  @override
  SelectCategoryWidgetState createState() => SelectCategoryWidgetState();
}

class SelectCategoryWidgetState extends State<SelectCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    log("category section===>");
    return GetBuilder<AddProductController>(
      builder: (addProductController){
        return Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: Dimensions.paddingSizeSmall),

            addProductController.categoryList.isNotEmpty ?
            Column(
              children: [
                DropdownDecoratorWidget(
                    child: DropdownButton<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingEye)),
                        value: addProductController.categoryList.contains(addProductController.categoryIndex) ? addProductController.categoryIndex : null,
                        hint: const Text('Select Category'),
                        items: addProductController.categoryList.map((String? item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item ?? '',
                              style: interMedium,
                            ),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          addProductController.setCategoryIndex(value, true);
                        },
                        isExpanded: true, underline: const SizedBox())
                ),

                const SizedBox(height: Dimensions.paddingSizeDefault),

              ],
            ) : const SizedBox.shrink(),


            addProductController.subCategoryList.isNotEmpty ?
            Column(children: [
              DropdownDecoratorWidget(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingEye)),
                  value: addProductController.subCategoryList.contains(addProductController.subCategoryIndex) ? addProductController.subCategoryIndex : null,
                  hint: const Text('Select SubCategory'),
                  items: addProductController.subCategoryList.map((String? item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item ?? '',
                        style: interMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    addProductController.setSubCategoryIndex(value, true);
                  },
                  isExpanded: true,
                  underline: const SizedBox(),
                ),
              ),

              const SizedBox(height: Dimensions.paddingSizeDefault),

            ],
            ) : const SizedBox.shrink(),


            addProductController.subCategoryList.isNotEmpty ?
            Column(children: [
              DropdownDecoratorWidget(
                child: DropdownButton<String>(
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingEye)),
                  value: addProductController.subCategoryList.contains(addProductController.subCategoryIndex) ? addProductController.subCategoryIndex : null,
                  hint: const Text('Select SubCategory'),
                  items: addProductController.subCategoryList.map((String? item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item ?? '',
                        style: interMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    addProductController.setSubCategoryIndex(value, true);
                  },
                  isExpanded: true,
                  underline: const SizedBox(),
                ),
              ),

              const SizedBox(height: Dimensions.paddingSizeDefault),

            ]) : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
