
import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/product_details/controllers/cmh_product_controller.dart';
import 'package:flutter_getx/helper/color_helper.dart';
import 'package:flutter_getx/helper/extension_helper.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';

class ProductTitleSectionWidget extends StatelessWidget {
  const ProductTitleSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const _PriceSection(),

        Container(
          color: Theme.of(context).cardColor,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: Dimensions.paddingSizeSmall),

              Text(
                'product_name'.tr,
                style: const TextStyle(
                  fontSize: Dimensions.fontSizeDefault,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Divider(color: Theme.of(context).primaryColor.withValues(alpha: 0.1)),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: Dimensions.iconSizeSmall, color: Colors.orange),
                        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                        Text('rating'.tr, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeSmall)),
                        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                        Text(
                          '(9.2k+ Rev)',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 15, width: 1, color: Theme.of(context).hintColor),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('22.5k+', style: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeSmall)),
                        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                        Text(
                          'Orders',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(height: 15, width: 1, color: Theme.of(context).hintColor),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('120', style: TextStyle(fontWeight: FontWeight.w500, fontSize: Dimensions.fontSizeSmall)),
                        const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                        Text(
                          'Wish Listed',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: Dimensions.fontSizeSmall,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Divider(color: Theme.of(context).primaryColor.withValues(alpha: 0.1)),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Text(
                'available_in'.tr,
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: Dimensions.fontSizeSmall,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: Dimensions.paddingSizeMedium),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('color'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w500)),
                  const SizedBox(width: Dimensions.paddingSizeSmall),

                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: GetBuilder<CmhProductController>(
                        builder: (cmhProductController) {
                          if (cmhProductController.hexColors.isEmpty) {
                            return const Center(child: Text('No colors available'));
                          }

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final bool isSelected = cmhProductController.selectedColorIndex == index;
                              final color = ColorHelper.hexCodeToColor(cmhProductController.hexColors[index]) ?? Theme.of(context).cardColor;
                              return InkWell(
                                onTap: () => cmhProductController.updateSelectedColorIndex(index),
                                child: Container(
                                  padding: const EdgeInsets.all(Dimensions.paddingSizeExtraSmall),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: color,
                                    border: isSelected ? Border.all(
                                      color: color.withValues(alpha: 0.2),
                                      width: 2,
                                    ) : null,
                                  ),
                                  child: Center(child: isSelected ? const CustomAssetImageWidget(Images.selectedIcon) : SizedBox(height: 20, width: 20,)),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: Dimensions.paddingSizeSmall),
                            itemCount: cmhProductController.hexColors.length,
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.paddingSizeSmall),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('size'.tr, style: const TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w500)),
                  const SizedBox(width: Dimensions.paddingSizeDefault),

                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: GetBuilder<CmhProductController>(
                        builder: (cmhProductController) {
                          if (cmhProductController.productSize.isEmpty) {
                            return const Center(child: Text('No Size available'));
                          }

                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final bool isSelected = cmhProductController.selectedSizeIndex == index;
                              return InkWell(
                                onTap: () => cmhProductController.updateSelectedSizeIndex(index),
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withValues(alpha: 0.2),
                                    boxShadow: isSelected ? [
                                      BoxShadow(
                                        color: context.customThemeColors.textColor.withValues(alpha: 0.1),
                                        blurRadius: 8.33,
                                        offset: const Offset(0, 3.33)
                                      )
                                    ] : null,
                                  ),
                                  child: Center(child: Text(cmhProductController.productSize[index], style: interMedium.copyWith(
                                      color: isSelected
                                          ? Theme.of(context).cardColor
                                          : context.customThemeColors.textColor,
                                    fontSize: Dimensions.fontSizeSmall,
                                  ))),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: Dimensions.paddingSizeSmall),
                            itemCount: cmhProductController.productSize.length,
                            scrollDirection: Axis.horizontal,
                            physics: const AlwaysScrollableScrollPhysics(),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PriceSection extends StatelessWidget {
  const _PriceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -10, 0),
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeMedium),
      color: Theme.of(context).primaryColor.withValues(alpha: 0.125),
      child: Row(children: [

        Flexible(
          flex: 4,
          child: Text('product_price'.tr,
            style: const TextStyle(fontSize: Dimensions.fontSizeExtraLarge, fontWeight: FontWeight.w700),
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),

        Flexible(
          flex: 4,
          child: Text('discount'.tr,
            style: TextStyle(
                fontSize: Dimensions.fontSizeSmall,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.lineThrough,
                decorationColor: Theme.of(context).hintColor,
                color: Theme.of(context).hintColor
            ),
          ),
        ),
        const SizedBox(width: Dimensions.paddingSizeSmall),

        Flexible(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.30), width: 1),
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.error.withValues(alpha: 0.05),
            ),
            child: Text('discount_percentage'.tr,
              style: TextStyle(fontSize: Dimensions.fontSizeSmall, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),

      ]),
    );
  }
}
