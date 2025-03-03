import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_header_single_child_listview_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_paginated_list_widget.dart';
import 'package:flutter_getx/common/basewidgets/dummy_widget.dart';
import 'package:flutter_getx/common/basewidgets/sliver_header_delegate.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/controllers/valley_home_controller.dart';
import 'package:flutter_getx/common/enum/valley_home_enum.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/inner_new_arrivals_tab_view_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/new_user_exclusive_section_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/one_time_deal_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/todays_deal_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/top_stores_card_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/valley_home_carousel_slider_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/welcome_banner_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:get/get.dart';

class ValleyHomeScreen extends StatefulWidget {
  const ValleyHomeScreen({super.key});

  @override
  State<ValleyHomeScreen> createState() => _ValleyHomeScreenState();
}

class _ValleyHomeScreenState extends State<ValleyHomeScreen>
    with TickerProviderStateMixin {

  final ValueNotifier<int> _tabIndexNotifier = ValueNotifier<int>(0);

  ValleyHomeController valleyHomeController = Get.find<ValleyHomeController>();

  late TabController _tabController;
  late TabController _tabController2;


  final ScrollController _scrollController = ScrollController();

  final List<OuterTabItem> tabs = OuterTabItem.values;
  final List<InnerTabItem> innerTabs = InnerTabItem.values;

  @override
  void initState() {
    super.initState();

    Get.find<ValleyHomeController>().getLatestProductList(1, isUpdate: false);

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
    final double widthSize = MediaQuery.sizeOf(context).width;

    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor, // Set your desired color
        statusBarIconBrightness: Brightness.light, // Light icons for dark status bar
      ),
      child: Scaffold(
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
      
                /// Outer tabbar
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverHeaderDelegate(
                    height: 51,
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
                        ],
                      ),
                    ),
                  ),
                ),
      
                /// Searchbar
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverHeaderDelegate(
                    height: 70,
                    child: const CustomSearchWidget(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSmall,
                        vertical: Dimensions.paddingSizeSmall,
                      ),
                    ),
                  ),
                ),
      
                if (_tabController.index == 0) ...[
                  /// One time deal
                  const SliverToBoxAdapter(
                    child: OneTimeDealWidget(),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 20)),
      
                  /// carousel slider
                  const SliverToBoxAdapter(
                    child: ValleyHomeCarouselSliderWidget(),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
      
      
                  /// poster - perfect wash
                  SliverToBoxAdapter(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeSmall),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        child: CustomAssetImageWidget(Images.bestWash, height: widthSize * 0.4, fit: BoxFit.fill),
                    ),
                  )),
      
      
                  /// New User Exclusive
                  const SliverToBoxAdapter(
                    child: NewUserExclusiveSectionWidget(),
                  ),


                  /// today deal
                  const SliverToBoxAdapter(
                    child: TodayDealWidget(),
                  ),
      
                  /// Top Stores
                  SliverToBoxAdapter(
                    child: CustomHeaderSingleChildListViewWidget(
                      headerWidget: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Top Stores'.tr,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          Text(
                            'view_all'.tr,
                            style: const TextStyle(fontSize: Dimensions.fontSizeSmall),
                          )
                        ],
                      ),
                      directionVertical: false,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width / 1.8,
                          child: const TopStoresCardWidget(),
                        );
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 10)),
      
                  /// poster
                  SliverToBoxAdapter(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      child: CustomAssetImageWidget(Images.posterImage, height: widthSize * 0.4, fit: BoxFit.fill),
                    ),
                  )),
                  const SliverToBoxAdapter(child: SizedBox(height: 30)),
      
                  /// Inner persistent Tabbar
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
                                  right: Dimensions.paddingSizeMedium, bottom: 0),
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
                                          : Theme.of(context).hintColor.withValues(alpha: 0.1),
                                      border: Border.all(
                                        color: selectedIndex == index
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context).hintColor.withValues(alpha: 0.2),
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      tab.title,
                                      style: TextStyle(
                                        color: selectedIndex == index ? Theme.of(context).cardColor : Colors.black.withValues(alpha: 0.5),
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
      
                const InnerNewArrivalsTabViewWidget(),
      
                DummyWidget(text: 'Tab ${_tabController.index}'),
      
                DummyWidget(text: 'Tab ${_tabController.index}'),
      
                DummyWidget(text: 'Tab ${_tabController.index}'),
      
                DummyWidget(text: 'Tab ${_tabController.index}'),
      
              ],
            ),
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
          hintText: "what_are_you_looking_for".tr,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: Container(
            width: 50,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(child: Icon(Icons.search, color: Theme.of(context).cardColor)),
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