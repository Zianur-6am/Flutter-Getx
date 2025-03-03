import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_user/product_details/controllers/cmh_product_controller.dart';
import 'package:flutter_getx/design_practice/6valley_user/product_details/widgets/cmh_review_widget.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';


class ProductReviewSectionWidget extends StatelessWidget {
  const ProductReviewSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

        Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSizeExtraSmall),
          child: Text('Reviews', style: interMedium.copyWith(
            color: context.customThemeColors.textColor.withValues(alpha: 0.7),
            fontSize: Dimensions.fontSizeDefault,
          )),
        ),

        Divider(color: Theme.of(context).primaryColor.withValues(alpha: 0.1), thickness: 1),
        const SizedBox(height: Dimensions.paddingSizeExtraSmall),

        SizedBox(
            height: 400,
            child: Stack(children: [
              const SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(children: [

                  CmhReviewWidget(),

                  CmhReviewWidget(),

                ]),
              ),

              Positioned(
                left: 0, right: 0,
                bottom: 0,
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
                  child: GetBuilder<CmhProductController>(
                    builder: (cmhProductController) {
                      return InkWell(
                        onTap: () {
                          cmhProductController.toggleReviewExpanded();
                        },
                        child: Icon(
                          cmhProductController.isReviewExpanded
                              ? Icons.expand_less_sharp
                              : Icons.expand_more_sharp,
                          size: 30,
                        ),
                      );
                    }
                  ),
                ),
              )

            ])
        ),
      ]),
    );
  }
}
