import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_app_bar.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/controllers/AddProductController.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/add_product_section_widget.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/add_product_title_bar.dart';
import 'package:flutter_getx/design_practice/6valley_seller/add_product/widgets/title_and_description_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> with TickerProviderStateMixin {

  final AddProductController addProductController = Get.put(AddProductController());
  
  TabController? _tabController;

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
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'add_product'.tr),
      body: CustomScrollView(slivers: [

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
                child: SizedBox(width: MediaQuery.of(context).size.width,
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

              Container(
                constraints: const BoxConstraints(minHeight: 140, maxHeight: 240),
                child: TabBarView(
                    controller: _tabController,
                    children: addProductController.tabBarNames.map((name) => TitleAndDescriptionWidget(addProductController: addProductController, index: addProductController.tabBarNames.indexOf(name))).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),
        ])),

      ]),
    );
  }
}
