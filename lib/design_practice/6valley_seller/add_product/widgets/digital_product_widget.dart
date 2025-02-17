import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/drop_down_decorator_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/controllers/AddProductController.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/domain/models/product_model.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';



class DigitalProductWidget extends StatefulWidget {
  final AddProductController? addProductController;
  final Product? product;
  final bool fromNextScreen;
  const DigitalProductWidget({super.key, this.addProductController, this.product, this.fromNextScreen = false});

  @override
  State<DigitalProductWidget> createState() => _DigitalProductWidgetState();
}

class _DigitalProductWidgetState extends State<DigitalProductWidget> {
  // PlatformFile? fileNamed;
  File? file;
  int?  fileSize;
  final List<String> itemList = ['physical', 'digital'];


  @override
  Widget build(BuildContext context) {

    return Column(children: [
      !widget.fromNextScreen ?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium),
        child: DropdownDecoratorWidget(
            title: 'Product Type',
            child: DropdownButton<String>(
              icon: const Icon(Icons.keyboard_arrow_down_outlined),
              borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingEye)),
              value: widget.addProductController!.productTypeIndex == 0 ? 'physical' : 'digital',
              items: itemList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: robotoMedium),
                );
              }).toList(),
              onChanged: (value) {
                widget.addProductController!.setProductTypeIndex(value == 'physical' ? 0 : 1, true);
              },
              isExpanded: true,
              underline: const SizedBox(),
            )),
      ) : const SizedBox(),

      !widget.fromNextScreen ?
      SizedBox(height: widget.addProductController!.productTypeIndex == 1 ? Dimensions.paddingSizeSmall : 0) : const SizedBox(),


      widget.fromNextScreen && widget.addProductController!.productTypeIndex == 1 && widget.addProductController!.digitalProductTypeIndex == 1?
      Padding(
        padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, Dimensions.paddingSizeDefault, 0),
        child: Container(
          padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall)
          ),
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: () async {
              // FilePickerResult? result = await FilePicker.platform.pickFiles(
              //   type: FileType.custom,
              //   allowedExtensions: ['pdf', 'zip', 'jpg', 'png', "jpeg", "gif"],
              // );
              // if (result != null) {
              //   file = File(result.files.single.path!);
              //   fileSize = await file!.length();
              //   fileNamed = result.files.first;
              //   widget.addProductController!.setSelectedFileName(file);
              //
              // }
            },
            child: Builder(
                builder: (context) {
                  return Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(width: 50,child: Image.asset(Images.upload)),
                      // widget.addProductController!.selectedFileForImport !=null ?
                      // Text(fileNamed != null? fileNamed?.name??'':'${widget.product!.digitalFileReady}',maxLines: 2,overflow: TextOverflow.ellipsis):
                      // Text(getTranslated('upload_file', context)!, style: robotoRegular.copyWith()),
                      //
                      // widget.product !=null && fileNamed == null ?
                      // Text(widget.product!.digitalFileReady??'', style: robotoRegular.copyWith()):const SizedBox(),

                    ],);
                }
            ),
          ),
        ),
      ):const SizedBox(),

      widget.fromNextScreen ?
      const SizedBox(height: Dimensions.paddingSizeDefault) : const SizedBox(),

    ]);
  }
}
