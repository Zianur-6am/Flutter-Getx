import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_asset_image_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_header_single_child_listview_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_singlechild_listview_widget.dart';
import 'package:flutter_getx/common/basewidgets/dummy_widget.dart';
import 'package:flutter_getx/common/basewidgets/sliver_header_delegate.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/controllers/valley_home_controller.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/inner_new_arrivals_tab_view_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/inner_tab_bar_valley_home_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/outer_explore_tab_view_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/top_stores_card_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/valley_home_carousel_slider_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/welcome_banner_widget.dart';
import 'package:flutter_getx/helper/tab_class.dart';
import 'package:flutter_getx/tab_bar/widgets/home_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:flutter_getx/utils/images.dart';
import 'package:flutter_getx/utils/styles.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ValleyHomeScreen extends StatefulWidget {
  const ValleyHomeScreen({super.key});

  @override
  State<ValleyHomeScreen> createState() => _ValleyHomeScreenState();
}

class _ValleyHomeScreenState extends State<ValleyHomeScreen> with TickerProviderStateMixin {

  bool _isLoading = false;
  List<String> _items = List.generate(20, (index) => "Item ${index + 1}");

  ValleyHomeController valleyHomeController = Get.put(ValleyHomeController());

  late TabController _tabController;
  late TabController _tabController2;

  late ScrollController _scrollController;

  final List<TabItem> tabs = [
    TabItem(title: 'Explore', content: const OuterExploreTabViewWidget()),
    TabItem(title: 'Sports', content: const OuterExploreTabViewWidget()),
    TabItem(title: 'Womens', content: const HomeTab()),
    TabItem(title: 'Kids', content: const HomeTab()),
    TabItem(title: 'Wigs', content: const HomeTab()),
    TabItem(title: 'Electronics', content: const HomeTab()),
  ];

  final List<TabItem> innerTabs = [
    TabItem(title: 'All', content: const InnerNewArrivalsTabViewWidget()),
    TabItem(title: 'Home', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Extra', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Selection', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Done', content: const DummyWidget(text: "All Tab")),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController2 = TabController(length: innerTabs.length, vsync: this);

    _scrollController = ScrollController()..addListener(_scrollListener);

    _tabController.addListener(() {
      if (mounted) {
        setState(() {}); // Rebuild UI when tab index changes
      }
    });


    _tabController2.addListener(() {
      print('-----------changed------------');
      setState(() {});

      if (mounted) {
        print('-----------changed------------');
        setState(() {}); // Rebuild UI when tab index changes
      }

      if (_tabController2.indexIsChanging) {
        print('-----------changed------------');
        setState(() {}); // Ensure UI updates after tab switch completes
      }
    });
  }


  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      _loadMoreItems();
    }
  }

  Future<void> _loadMoreItems() async {
    setState(() {
      _isLoading = true;
    });
    // Simulate a delay (like making an API call)
    await Future.delayed(Duration(seconds: 2));
    List<String> newItems = List.generate(10, (index) => "Item ${_items.length + index + 1}");
    setState(() {
      _isLoading = false;
      _items.addAll(newItems);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [

              const WelcomeBannerWidget(),

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
                            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium, vertical: 0),
                            labelPadding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraLarge, bottom: 0),
                            controller: _tabController,
                            labelColor: Theme.of(context).cardColor,
                            unselectedLabelColor: Theme.of(context).hintColor,
                            indicatorColor: Colors.orange,
                            indicatorWeight: 5,
                            indicatorPadding: const EdgeInsets.only(bottom: 0),
                            dividerColor: Colors.transparent,
                            tabs: tabs.map((tab) => Tab(
                              child: Text(tab.title),
                            )).toList()
                        ),


                        const CustomSearchWidget(
                          horizontalPadding: Dimensions.paddingSizeSmall,
                          verticalPadding: Dimensions.paddingSizeSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              if(_tabController.index == 0) ... [

                SliverToBoxAdapter(
                  child: CustomHeaderSingleChildListViewWidget(
                    backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                    headerWidget: const Row(
                      children: [
                        CustomAssetImageWidget(Images.oneTimeDealImage, height: 50, width: 33,)
                      ],
                    ),
                    directionVertical: false,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return const ProductCardWidget();
                    },
                  ),
                ),

                const SliverToBoxAdapter(
                  child: ValleyHomeCarouselSliderWidget(),
                ),


                SliverToBoxAdapter(
                  child: CustomHeaderSingleChildListViewWidget(
                    headerWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Top Products', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),

                        Text('View All', style: TextStyle(fontSize: 12))
                      ],
                    ),
                    directionVertical: false,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return const TopStoresCardWidget();
                    },
                  ),
                ),

                SliverToBoxAdapter(
                  child: CustomHeaderSingleChildListViewWidget(
                    headerWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('New User Exclusive', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),

                        Text('View All', style: TextStyle(fontSize: 12))
                      ],
                    ),
                    directionVertical: false,
                    itemCount: 10,
                    itemBuilder: (context, index){
                      return const ProductCardWidget(productImage: Images.bagIcon);
                    },
                  ),
                ),


                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverHeaderDelegate(
                    height: 55,
                    child:  Container(
                      color: Theme.of(context).cardColor,
                      child: TabBar(
                          tabAlignment: TabAlignment.start,
                          physics: const BouncingScrollPhysics(),
                          isScrollable: true,
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium, vertical: 0),
                          labelPadding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraLarge, bottom: 0),
                          controller: _tabController2,
                          labelColor: Theme.of(context).cardColor,
                          unselectedLabelColor: Theme.of(context).hintColor,
                          indicatorColor: Theme.of(context).scaffoldBackgroundColor,
                          indicatorWeight: 5,
                          indicatorPadding: const EdgeInsets.only(bottom: 0),
                          dividerColor: Colors.transparent,
                          tabs: innerTabs.map((tab) => Tab(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: _tabController2.index == innerTabs.indexOf(tab) ? Theme.of(context).primaryColor : null,
                                  border: Border.all(color: _tabController2.index == innerTabs.indexOf(tab) ? Colors.blue : Colors.grey, width: 1)
                              ),
                              child: Text(tab.title, style: TextStyle(color: _tabController2.index == innerTabs.indexOf(tab) ? Colors.white : Colors.grey)),
                            ),
                          )).toList()
                      ),
                    ),
                  ),
                ),


                // SliverGrid(
                //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //     maxCrossAxisExtent: MediaQuery.sizeOf(context).width * 0.41,
                //     mainAxisSpacing: 10.0,
                //     crossAxisSpacing: 10.0,
                //     childAspectRatio: 4.0,
                //   ),
                //   delegate: SliverChildBuilderDelegate(
                //         (BuildContext context, int index) {
                //       return ProductCardWidget();
                //     },
                //     childCount: 100,
                //   ),
                // ),


                SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      mainAxisExtent: 250, // Set this to your card's expected height
                    ),
                    delegate: SliverChildBuilderDelegate(
                          (context, index) {
                        return const ProductCardWidget(margin: EdgeInsets.zero);
                      },
                      childCount: _items.length,
                    ),
                  ),
                ),

                if (_isLoading)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),


                // SliverFillRemaining(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8),
                //     child: ColoredBox(color: Colors.red,
                //       child: MasonryGridView.builder(
                //         // physics: const NeverScrollableScrollPhysics(),
                //         gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                //           crossAxisCount: 2,
                //         ),
                //         mainAxisSpacing: 12, // Space between rows
                //         crossAxisSpacing: 12,
                //         itemCount: 10,
                //         itemBuilder: (context, index) {
                //           return const ProductCardWidget(margin: EdgeInsets.zero,);
                //         },
                //       ),
                //     ),
                //   ),
                // ),

              ]
              else
                SliverToBoxAdapter(
                  child: TabBarView(
                    controller: _tabController,
                    children: tabs.map((tab) => tab.content).toList(),
                  ),
                )
            ],
          )
      ),
    );
  }
}

class CustomSearchWidget extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;

  const CustomSearchWidget({
    super.key, this.horizontalPadding = 10, this.verticalPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      color: Theme.of(context).cardColor,
      child: TextField(
        decoration: InputDecoration(
          hintText: "What are you looking for?",
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: Container(
            margin: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.search, color: Colors.white,),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Theme.of(context).hintColor.withValues(alpha: 0.5), width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5), width: 1),
          ),
          fillColor: Theme.of(context).cardColor,
          filled: true,
        ),
      ),
    );


    //   SliverPersistentHeader(
    //   pinned: true,
    //   delegate: SliverHeaderDelegate(
    //     height: 70,
    //     child: Container(
    //       padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
    //       color: Theme.of(context).cardColor,
    //       child: TextField(
    //         decoration: InputDecoration(
    //           hintText: "What are you looking for?",
    //           hintStyle: const TextStyle(color: Colors.grey),
    //           suffixIcon: Container(
    //             margin: const EdgeInsets.only(top: 5, right: 5, bottom: 5),
    //             decoration: BoxDecoration(
    //               color: Colors.blue,
    //               borderRadius: BorderRadius.circular(8),
    //             ),
    //             child: const Icon(Icons.search, color: Colors.white,),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(5),
    //             borderSide: BorderSide(color: Theme.of(context).hintColor.withValues(alpha: 0.5), width: 1),
    //           ),
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(5),
    //             borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5), width: 1),
    //           ),
    //           focusedBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.circular(5),
    //             borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5), width: 1),
    //           ),
    //           fillColor: Theme.of(context).cardColor,
    //           filled: true,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
