import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_getx/common/basewidgets/custom_app_bar.dart';
import 'package:flutter_getx/common/basewidgets/drop_down_decorator_widget.dart';
import 'package:flutter_getx/common/basewidgets/textfield/custom_text_feild_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/controllers/AddProductController.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/domain/models/product_model.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/add_product_section_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/add_product_title_bar.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/digital_product_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/select_category_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/title_and_description_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  final Product? product;
  const AddProductScreen({super.key, this.product});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> with TickerProviderStateMixin {

  final AddProductController addProductController = Get.put(AddProductController());
  
  TabController? _tabController;
  static const List<String> authors = ["Auth 1", "Auth 2", "Auth 3", "Auth 3", "Auth 4", "Auth 5", "Auth 6"];
  final List<String> publishingHouses = ["Pub 1", "Pub 2", "Pub 3", "Pub 3", "Pub 4", "Pub 5", "Pub 6"];

  final List<String> deliveryTypeList =['Ready after sell', 'Ready Product'];
  FocusNode _publishingFocus = FocusNode();
  FocusNode _authorFocus = FocusNode();
  final ScrollController _scrollController = ScrollController();
  double optionHeight = 0;

  @override
  void initState() {
    addProductController.setSelectedPageIndex(0, isUpdate: false);

    _tabController = TabController(length: addProductController.tabBarNames.length, initialIndex: 0, vsync: this);
    _tabController?.addListener((){
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double longestSide = MediaQuery.sizeOf(context).longestSide;
    final double widthSize = MediaQuery.sizeOf(context).width;
    final double heightSize = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: CustomAppBarWidget(title: 'add_product'.tr),
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium, vertical: Dimensions.paddingSizeSmall),
                  child: AddProductTitleBar(),
                ),
              ),

              SliverToBoxAdapter(child: Column(crossAxisAlignment:CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                AddProductSectionWidget(
                  title: 'Product Name',
                  childrens: [
                    Padding(
                      padding: const EdgeInsets.only(top: Dimensions.paddingSizeExtraSmall, left: Dimensions.paddingEye, bottom: Dimensions.paddingEye),
                      child: SizedBox(width: widthSize,
                        child: TabBar(
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          dividerColor: Colors.transparent,
                          controller: _tabController,
                          indicatorColor: Theme.of(context).primaryColor,
                          indicatorWeight: 1,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                          indicator: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Theme.of(context).primaryColor, width: 2,),
                            ),
                          ),
                          unselectedLabelStyle: robotoRegular.copyWith(color: Theme.of(context).hintColor,),
                          labelStyle: robotoBold.copyWith(fontSize: Dimensions.fontSizeLarge,
                            color: Theme.of(context).disabledColor,),
                          tabs: addProductController.tabBarNames.map((name) => Tab(child: Text(name))).toList(),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: longestSide / 4,
                      child: TabBarView(
                          controller: _tabController,
                          children: addProductController.tabBarNames.map((name) => TitleAndDescriptionWidget(addProductController: addProductController, index: addProductController.tabBarNames.indexOf(name))).toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.paddingSizeDefault),

                GetBuilder<AddProductController>(
                  builder: (addProductController) {
                    return AddProductSectionWidget(
                      title: 'General Setup',
                      childrens: <Widget>[
                        const SizedBox(height: Dimensions.paddingSizeSmall),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium),
                          child: SelectCategoryWidget(product: null),
                        ),


                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium),
                          child: Column(
                            children: [
                              DropdownDecoratorWidget(
                                child: DropdownButton<String>(
                                  value: addProductController.brandList.contains(addProductController.brandIndex) ? addProductController.brandIndex : null,
                                  hint: const Text('Select Brand'),
                                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                  borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingEye)),
                                  items: addProductController.brandList.map((String? item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item ?? '',
                                        style: robotoMedium,
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    addProductController.setBrandIndex(value, true);
                                    // addProductController.changeBrandSelectedIndex(value);
                                  },
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                ),
                              ),

                              const SizedBox(height: Dimensions.paddingSizeSmall),

                            ],
                          ),
                        ),


                        // addProductController.productTypeIndex == 0 ?
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium),
                        //   child: Column(
                        //     children: [
                        //       DropdownDecoratorWidget(
                        //         child: DropdownButton<String>(
                        //           icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        //           borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingEye)),
                        //           hint: (addProductController.unitValue == null || addProductController.unitValue == 'select_unit' || addProductController.unitValue == 'null')
                        //               ? Text(getTranslated('select_unit', context)!, style: robotoMedium.copyWith(color: Theme.of(context).hintColor))
                        //               : Text(addProductController.unitValue!, style: robotoMedium.copyWith(
                        //             color: Theme.of(context).textTheme.bodyLarge?.color,
                        //             fontSize: Dimensions.fontSizeExtraLarge,
                        //           )),
                        //           items: Provider.of<SplashController>(context,listen: false).configModel!.unit!.map((String value) {
                        //             return DropdownMenuItem<String>(
                        //               value: value,
                        //               child: Text(value, style: robotoMedium),
                        //             );}).toList(),
                        //           onChanged: (val) {
                        //             unitValue = val;
                        //             setState(() {addProductController.setValueForUnit(val);},);},
                        //           isExpanded: true,
                        //           underline: const SizedBox(),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ) : const SizedBox(),


                        Container(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeMedium, 0, Dimensions.paddingSizeMedium, 0),
                          child: Column(children: [
                            Row(
                              children: [
                                const Spacer(),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: (){
                                    addProductController.productCode.text = _generateSKU();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeExtraSmall),
                                    child: Text('Generate Code', style: robotoMedium.copyWith(fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).primaryColor)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: Dimensions.paddingSizeExtraSmall),

                            CustomTextFieldWidget(
                              formProduct: true,
                              required: true,
                              border: true,
                              borderColor: Theme.of(context).primaryColor.withValues(alpha: .25),
                              controller: addProductController.productCode,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.text,
                              isAmount: false,
                              hintText: 'product Code Sku',
                            ),
                          ]),
                        ),
                        const SizedBox(height: Dimensions.paddingSizeDefault),



                        DigitalProductWidget(addProductController: addProductController, product: widget.product),
                        const SizedBox(height: Dimensions.paddingSizeSmall),

                        //Author
                        addProductController.productTypeIndex == 1 ?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium, vertical: Dimensions.paddingSizeSmall),
                          child: Autocomplete<String>(
                            optionsBuilder: (TextEditingValue value) {
                              if (value.text.isEmpty) {
                                return const Iterable<String>.empty();
                              } else {
                                return authors.where((author) => author.toLowerCase().contains(value.text.toLowerCase()));
                              }
                            },
                            fieldViewBuilder: (context, controller, node, onComplete) {
                              _authorFocus = node;
                              if(!node.hasFocus){
                                _authorFocus.unfocus();
                              } else{
                                _authorFocus.requestFocus();
                              }
                              return TextField(
                                keyboardType: TextInputType.text,
                                controller: controller,
                                focusNode: node,
                                onEditingComplete: onComplete,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize, horizontal: Dimensions.paddingSizeMedium),
                                  hintText: 'Author Creator Artist',
                                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                                  labelText: 'Author Creator Artist',
                                  labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor), borderRadius: BorderRadius.circular(8)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Theme.of(context).primaryColor.withValues(alpha: .25), width: .75)),
                                ),
                              );
                            },
                            displayStringForOption: (value) =>  value,
                            optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height:  (keyboardHeight == 0 &&  (_authorFocus.hasFocus)) ? 155 : 250,
                                  padding: const EdgeInsets.only(right: 8.0), // Add padding to the right
                                  width: MediaQuery.of(context).size.width * 0.9, // Adjust the width if needed
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                                    boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                                        spreadRadius: 0.5, blurRadius: 0.3)],
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: options.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final String option = options.elementAt(index);
                                      return InkWell(
                                        onTap: () {
                                          onSelected(option);
                                        },
                                        child: Builder(
                                          builder: (BuildContext context) {
                                            final bool highlight = AutocompleteHighlightedOption.of(context) == index;
                                            if (highlight) {
                                              SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
                                                Scrollable.ensureVisible(context, alignment: 0.5);
                                              }, debugLabel: 'AutocompleteOptions.ensureVisible');
                                            }
                                            return Container(
                                              color: highlight ? Theme.of(context).focusColor : null,
                                              padding: const EdgeInsets.all(16.0),
                                              child: Text(option),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ) : const SizedBox(),

                        const SizedBox(height: Dimensions.paddingSizeSmall),

                        ///Publishing
                        addProductController.productTypeIndex == 1  ?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium, vertical: Dimensions.paddingSizeSmall),
                          child: Autocomplete<String> (
                            optionsBuilder: (TextEditingValue value) {
                              if (value.text.isEmpty) {
                                return const Iterable<String>.empty();
                              } else {
                                return publishingHouses.where((author) => author.toLowerCase().contains(value.text.toLowerCase()));
                              }
                            },
                            fieldViewBuilder: (context, controller, node, onComplete) {
                              _publishingFocus = node;
                              if(!node.hasFocus){
                                _publishingFocus.unfocus();
                              } else{
                                _publishingFocus.requestFocus();
                              }
                              return TextField(
                                keyboardType: TextInputType.text,
                                controller: controller,
                                focusNode: node,
                                onEditingComplete: onComplete,
                                decoration: InputDecoration(
                                  hintText: 'Publishing House',
                                  contentPadding: const EdgeInsets.symmetric(vertical: Dimensions.paddingSize, horizontal: Dimensions.paddingSizeMedium),
                                  hintStyle: TextStyle(color: Theme.of(context).hintColor),
                                  labelText: 'Publishing House',
                                  labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
                                  border: InputBorder.none,
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).primaryColor)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(color: Theme.of(context).primaryColor.withValues(alpha: .25), width: .75)
                                  ),
                                ),
                              );
                            },
                            displayStringForOption: (value) =>  value,
                            optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  padding: const EdgeInsets.only(right: 8.0), // Add padding to the right
                                  width: MediaQuery.of(context).size.width * 0.9, //
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
                                    boxShadow: [BoxShadow(color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                                        spreadRadius: 0.5, blurRadius: 0.3)],
                                  ),

                                  // Adjust the width if needed
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: options.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      final String option = options.elementAt(index);
                                      return InkWell(
                                        onTap: () {
                                          onSelected(option);
                                        },
                                        child: Builder(
                                          builder: (BuildContext context) {
                                            final bool highlight = AutocompleteHighlightedOption.of(context) == index;
                                            if (highlight) {
                                              SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
                                                Scrollable.ensureVisible(context, alignment: 0.5);
                                              }, debugLabel: 'AutocompleteOptions.ensureVisible');
                                            }
                                            return Container(
                                              color: highlight ? Theme.of(context).focusColor : null,
                                              padding: const EdgeInsets.all(16.0),
                                              child: Text(option),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ) : const SizedBox(),

                        const SizedBox(height: Dimensions.paddingSizeSmall),

                        addProductController.productTypeIndex == 1 ?
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            DropdownDecoratorWidget(
                              title: 'Delivery Type',
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                                borderRadius: const BorderRadius.all(Radius.circular(Dimensions.paddingEye)),
                                value: addProductController.digitalProductTypeIndex == 0 ? 'Ready after sell' : 'Ready Product',
                                items: deliveryTypeList.map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: robotoMedium)
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  addProductController.setDigitalProductTypeIndex(value == 'Ready after sell' ? 0 : 1, isUpdate: true);
                                },
                                isExpanded: true,
                                underline: const SizedBox(),
                              ),
                            ),
                          ]),
                        ) : const SizedBox(),

                        const SizedBox(height: 15),

                      ],
                    );
                  }
                ),
              ])),

            ]),
          ),

          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withValues(alpha: .10),
                  blurRadius: 30,
                  offset: const Offset(0, -7)
                )
              ]
            ),
            child: Container(height: 45,
              margin: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeSmall),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
              ),
              child: const Center(child: Text('Next', style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w600,
                  fontSize: Dimensions.fontSizeLarge),
              )),
            ),
          )
        ],
      ),
    );
  }
}


String _generateSKU() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  String sku = '';

  for (int i = 0; i < 6; i++) {
    sku += chars[random.nextInt(chars.length)];
  }
  return sku;
}
