import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/textfield/custom_text_feild_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/controllers/AddProductController.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';

class TitleAndDescriptionWidget extends StatefulWidget {
  final AddProductController addProductController;
  final int index;
  const TitleAndDescriptionWidget({super.key, required this.addProductController, required  this.index});

  @override
  State<TitleAndDescriptionWidget> createState() => _TitleAndDescriptionWidgetState();
}

class _TitleAndDescriptionWidgetState extends State<TitleAndDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal : Dimensions.iconSizeSmall),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text('Insert language wise product name and description',
              style: interRegular.copyWith(color: Theme.of(context).hintColor,
                fontSize: Dimensions.fontSizeSmall),),
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall,),


          const SizedBox(height: Dimensions.paddingSizeSmall),
          CustomTextFieldWidget(
            formProduct: true,
            textInputAction: TextInputAction.next,
            controller: TextEditingController(text: widget.addProductController.titleControllerList[widget.index].text),
            textInputType: TextInputType.name,
            required: true,
            hintText: 'Product Name',
            border: true,
            borderColor: Theme.of(context).primaryColor.withValues(alpha: .25),
            onChanged: (String text) {
              widget.addProductController.setTitle(widget.index, text);
            },
          ),
          const SizedBox(height: Dimensions.paddingSizeExtraLarge),


          CustomTextFieldWidget(
            formProduct: true,
            required: true,
            isDescription: true,
            controller: TextEditingController(text: widget.addProductController.descriptionControllerList[widget.index].text),
            onChanged: (String text) => widget.addProductController.setDescription(widget.index, text),
            textInputType: TextInputType.multiline,
            maxLine: 3,
            border: true,
            borderColor: Theme.of(context).primaryColor.withValues(alpha: .25),
            hintText: 'Product Description',
          ),

        ],),
    );
  }
}
