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
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ValleyHomeScreen extends StatefulWidget {
  const ValleyHomeScreen({super.key});

  @override
  State<ValleyHomeScreen> createState() => _ValleyHomeScreenState();
}

class _ValleyHomeScreenState extends State<ValleyHomeScreen> with TickerProviderStateMixin {

  ValleyHomeController valleyHomeController = Get.put(ValleyHomeController());

  late TabController _tabController;
  late TabController _tabController2;

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

    _tabController.addListener(() {
      if (mounted) {
        setState(() {}); // Rebuild UI when tab index changes
      }
    });


    _tabController2.addListener(() {
      print('-----------changed------------');

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: false,
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (context, _){
            return [

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


              /// todo - need to change padding passing way
              // const CustomSearchWidget(
              //     horizontalPadding: Dimensions.paddingSizeSmall,
              //     verticalPadding: Dimensions.paddingSizeSmall,
              // ),

              if(_tabController.index == 0) ...[

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


                SliverFillRemaining(
                  child: TabBarView(
                    controller: _tabController2,
                    children: innerTabs.map((tab) => tab.content).toList(),
                  ),
                ),





                // GetBuilder<HomeController>(builder: (homeController){
                //   return homeController.blogCount != 0 ?
                //   SliverPadding(
                //     padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
                //     sliver: SliverList(
                //       delegate: SliverChildBuilderDelegate(
                //             (context, index){
                //           return const BlogCardWidget();
                //         },
                //         childCount: homeController.blogCount,
                //       ),
                //     ),
                //   ) : const SizedBox.shrink();
                // }),
                //
                // SliverToBoxAdapter(child: Padding(
                //   padding: const EdgeInsets.only(bottom: 20),
                //   child: InkWell(
                //     onTap: (){
                //       homeController.increaseBlogCount();
                //     },
                //     child: const Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                //       Text('See More', style: TextStyle(color: Colors.blue, fontSize: 16)),
                //       SizedBox(width: 5),
                //
                //       Icon(Icons.keyboard_arrow_down, color: Colors.blue),
                //     ]),
                //   ),
                // )),
              ]

            ];
          },
          body: _tabController.index != 0 ? TabBarView(
            controller: _tabController,
            children: tabs.map((tab) => tab.content).toList(),
          ) : const SizedBox(height: 0),
        ),
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
