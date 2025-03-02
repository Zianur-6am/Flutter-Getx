import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_user/product_details/controllers/cmh_product_controller.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class ProductDescriptionWidget extends StatefulWidget {
  const ProductDescriptionWidget({super.key});

  @override
  State<ProductDescriptionWidget> createState() => _ProductDescriptionWidgetState();
}

class _ProductDescriptionWidgetState extends State<ProductDescriptionWidget> {
  bool isExpanded = false;



  @override
  void initState() {
    super.initState();
    Get.find<CmhProductController>().calculationDescriptionExpandable();
  }



  @override
  Widget build(BuildContext context) {
    return GetBuilder<CmhProductController>(
        builder: (cmhProductController){
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.05),
                  offset: const Offset(0,3),
                  blurRadius: 15,
                  spreadRadius: -3,
                ),
              ],

                gradient: LinearGradient(
                    colors: [
                      Theme.of(context).cardColor.withValues(alpha: 0.0),
                      Theme.of(context).cardColor.withValues(alpha: 0.0),
                      Theme.of(context).cardColor
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                ),

            ),
            height: cmhProductController.isDescriptionExpandable
                ? !cmhProductController.isDescriptionExpanded ? 270 : null
                : 270,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                      Text('details'.tr, style: interSemiBold.copyWith(
                        fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.7),
                      ),),
                      const SizedBox(height: Dimensions.paddingSizeSmall),

                      Divider(height: 1, color: Theme.of(context).primaryColor.withOpacity(0.09)),
                      const SizedBox(height: Dimensions.paddingSizeSmall),

                      if (cmhProductController.description.isNotEmpty) ...[

                        Text(cmhProductController.description, style: interRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                        ),),
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                      ],
                      cmhProductController.descriptionImage != null &&
                          cmhProductController.descriptionImage!.isNotEmpty
                          ? SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          cmhProductController.descriptionImage ?? "",
                          fit: BoxFit.fitWidth,
                        ),
                      )
                          : const SizedBox.shrink(),
                      const SizedBox(height: Dimensions.paddingSizeDefault),
                    ],
                    ),
                  ),
                ),

                cmhProductController.isDescriptionExpandable
                    ? Positioned(left: 0, right: 0,
                  bottom: cmhProductController.isDescriptionExpanded ? 10 : 5,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.1),
                          offset: const Offset(0.0, 10),
                          blurRadius: 15,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        cmhProductController.setDescriptionExpanded();
                      },
                      child: Icon(
                        cmhProductController.isDescriptionExpanded
                            ? Icons.expand_less_sharp
                            : Icons.expand_more_sharp,
                        size: 30,
                      ),
                    ),
                  ),
                )
                    : const SizedBox(),
              ],
            ),
          );
        });
  }
}
