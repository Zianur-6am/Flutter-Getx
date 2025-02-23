import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_header_single_child_listview_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_paginated_list_widget.dart';
import 'package:flutter_getx/common/basewidgets/dummy_widget.dart';
import 'package:flutter_getx/common/basewidgets/sliver_header_delegate.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/controllers/valley_home_controller.dart';
import 'package:flutter_getx/common/enum/valley_home_enum.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/inner_new_arrivals_tab_view_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/outer_explore_tab_view_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/top_stores_card_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/valley_home_carousel_slider_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/welcome_banner_widget.dart';
import 'package:flutter_getx/helper/tab_class.dart';
import 'package:flutter_getx/tab_bar/widgets/home_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ValleyHomeScreen extends StatefulWidget {
  const ValleyHomeScreen({super.key});

  @override
  State<ValleyHomeScreen> createState() => _ValleyHomeScreenState();
}

class _ValleyHomeScreenState extends State<ValleyHomeScreen>
    with TickerProviderStateMixin {

  final ValueNotifier<int> _tabIndexNotifier = ValueNotifier<int>(0);

  ValleyHomeController valleyHomeController = Get.put(ValleyHomeController());

  late TabController _tabController;
  late TabController _tabController2;

  List<String> _items = List.generate(10, (index) => 'Item ${index + 1}');

  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  final List<OuterTabItem> tabs = OuterTabItem.values;
  final List<InnerTabItem> innerTabs = InnerTabItem.values;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController2 = TabController(length: innerTabs.length, vsync: this);

    // Add listener to update UI when tab index changes
    _tabController.addListener(() {
      setState(() {});
    });

    _tabController2.addListener(() {
      if (!_tabController2.indexIsChanging) {
        _tabIndexNotifier.value = _tabController2.index;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController2.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: false,
          physics: const ClampingScrollPhysics(),
          controller: _scrollController,
          headerSliverBuilder: (context, _) {
            return [
              const SliverAppBar(
                automaticallyImplyLeading: false,
                title: WelcomeBannerWidget(),
                floating: true,
                snap: true,
                centerTitle: true,
                leading: SizedBox(),
                titleSpacing: 0,
                leadingWidth: 0,
              ),

              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate(
                  height: 127,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      children: [
                        TabBar(
                          tabAlignment: TabAlignment.start,
                          physics: const BouncingScrollPhysics(),
                          isScrollable: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeMedium, vertical: 0),
                          labelPadding: const EdgeInsets.only(
                              right: Dimensions.paddingSizeExtraLarge, bottom: 0),
                          controller: _tabController,
                          labelColor: Theme.of(context).cardColor,
                          unselectedLabelColor: Theme.of(context).hintColor,
                          indicatorColor: Colors.orange,
                          indicatorWeight: 5,
                          indicatorPadding: const EdgeInsets.only(bottom: 0),
                          dividerColor: Colors.transparent,
                          tabs: tabs.map((tab) => Tab(
                            child: Text(tab.title),
                          )).toList(),
                        ),

                        const CustomSearchWidget(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.paddingSizeSmall,
                              vertical: Dimensions.paddingSizeSmall),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (_tabController.index == 0) ...[
                SliverToBoxAdapter(
                  child: CustomHeaderSingleChildListViewWidget(
                    backgroundColor: Theme.of(context)
                        .primaryColor
                        .withValues(alpha: 0.1),
                    headerWidget: const Row(
                      children: [
                        CustomAssetImageWidget(
                          Images.oneTimeDealImage,
                          height: 50,
                          width: 33,
                        )
                      ],
                    ),
                    directionVertical: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ProductCardWidget();
                    },
                  ),
                ),
                const SliverToBoxAdapter(
                  child: ValleyHomeCarouselSliderWidget(),
                ),

                /// Top Products
                SliverToBoxAdapter(
                  child: CustomHeaderSingleChildListViewWidget(
                    headerWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Products',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    directionVertical: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const TopStoresCardWidget();
                    },
                  ),
                ),

                /// New User Exclusive
                SliverToBoxAdapter(
                  child: CustomHeaderSingleChildListViewWidget(
                    headerWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New User Exclusive',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    directionVertical: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ProductCardWidget(productImage: Images.bagIcon);
                    },
                  ),
                ),

                /// Inner persistent header
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverHeaderDelegate(
                    height: 55,
                    child: Container(
                      color: Theme.of(context).cardColor,
                      child: ValueListenableBuilder<int>(
                        valueListenable: _tabIndexNotifier,
                        builder: (context, selectedIndex, child) {
                          return TabBar(
                            tabAlignment: TabAlignment.start,
                            physics: const BouncingScrollPhysics(),
                            isScrollable: true,
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.paddingSizeMedium, vertical: 0),
                            labelPadding: const EdgeInsets.only(
                                right: Dimensions.paddingSizeExtraLarge, bottom: 0),
                            controller: _tabController2,
                            labelColor: Theme.of(context).cardColor,
                            unselectedLabelColor: Theme.of(context).hintColor,
                            indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                            indicatorWeight: 5,
                            onTap: (value) => _tabIndexNotifier.value = value, // Update notifier on tap
                            indicatorPadding: const EdgeInsets.only(bottom: 0),
                            dividerColor: Colors.transparent,
                            tabs: innerTabs.asMap().entries.map((entry) {
                              int index = entry.key;
                              var tab = entry.value;

                              return Tab(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: selectedIndex == index
                                        ? Theme.of(context).primaryColor
                                        : null,
                                    border: Border.all(
                                      color: selectedIndex == index ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Text(
                                    tab.title,
                                    style: TextStyle(
                                      color: selectedIndex == index ? Theme.of(context).cardColor : Theme.of(context).hintColor,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                ),

              ]
            ];
          },
          body: TabBarView(
            controller: _tabController2,
            children: [

              GetBuilder<ValleyHomeController>(
                  builder: (valleyHomeController) {
                    return PaginatedListWidget(
                      onPaginate: (int? offset) async {
                        await valleyHomeController.getItem();
                      },
                      // scrollController: _scrollController,
                      offset: 1,
                      totalSize: valleyHomeController.totalSize,
                      builder: (loaderWidget){
                        return Expanded(
                          child: Column(mainAxisSize: MainAxisSize.min,children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: MasonryGridView.builder(
                                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  mainAxisSpacing: 12, // Space between rows
                                  crossAxisSpacing: 12,
                                  // shrinkWrap: true,
                                  itemCount: valleyHomeController.items.length,
                                  itemBuilder: (context, index) {
                                    return const ProductCardWidget(margin: EdgeInsets.zero,);
                                  },
                                ),
                              ),
                            ),

                            loaderWidget,
                          ]),
                        );
                      },
                    );
                  }
              ),

              DummyWidget(text: 'Tab ${_tabController.index}'),

              DummyWidget(text: 'Tab ${_tabController.index}'),

              DummyWidget(text: 'Tab ${_tabController.index}'),

              DummyWidget(text: 'Tab ${_tabController.index}'),

            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;

  const CustomSearchWidget({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      color: Theme.of(context).cardColor,
      child: TextField(
        decoration: InputDecoration(
          hintText: "What are you looking for?",
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: Container(
            margin: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Theme.of(context).hintColor.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey.withValues(alpha: 0.5),
              width: 1,
            ),
          ),
          fillColor: Theme.of(context).cardColor,
          filled: true,
        ),
      ),
    );
  }
}