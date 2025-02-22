import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_header_single_child_listview_widget.dart';
import 'package:flutter_getx/common/basewidgets/custom_header_sliver_list_widget.dart';
import 'package:flutter_getx/common/basewidgets/dummy_widget.dart';
import 'package:flutter_getx/common/basewidgets/sliver_header_delegate.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/product_card_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/inner_tab_bar_valley_home_widget.dart';
import 'package:flutter_getx/helper/tab_class.dart';
import 'package:flutter_getx/tab_bar/controllers/tab_controller.dart';
import 'package:flutter_getx/tab_bar/widgets/blog_card_widget.dart';
import 'package:flutter_getx/tab_bar/widgets/home_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:get/get.dart';

class OuterExploreTabViewWidget extends StatefulWidget {
  const OuterExploreTabViewWidget({super.key});

  @override
  State<OuterExploreTabViewWidget> createState() => _OuterExploreTabViewWidgetState();
}



class _OuterExploreTabViewWidgetState extends State<OuterExploreTabViewWidget> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  final HomeController homeController = Get.put(HomeController());

  final List<TabItem> tabs = [
    TabItem(title: 'All', content: const HomeTab()),
    TabItem(title: 'Home', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Extra', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Selection', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Done', content: const DummyWidget(text: "All Tab")),
  ];


  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    Get.find<HomeController>().initialBlogCount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
          slivers: [

            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),


            SliverToBoxAdapter(
              child: CustomHeaderSingleChildListViewWidget(
                backgroundColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                headerWidget: const Row(
                  children: [
                    Text("One Time Deal"),
                  ],
                ),
                directionVertical: false,
                itemCount: 10,
                itemBuilder: (context, index){
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ProductCardWidget(),
                  );
                },
              ),
            ),

            GetBuilder<HomeController>(builder: (homeController){
              return homeController.blogCount != 0 ?
              SliverPadding(
                padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index){
                      return const BlogCardWidget();
                    },
                    childCount: homeController.blogCount,
                  ),
                ),
              ) : const SizedBox.shrink();
            }),
      
            SliverToBoxAdapter(child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: (){
                  homeController.increaseBlogCount();
                },
                child: const Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text('See More', style: TextStyle(color: Colors.blue, fontSize: 16)),
                  SizedBox(width: 5),
      
                  Icon(Icons.keyboard_arrow_down, color: Colors.blue),
                ]),
              ),
            )),
      
            // SliverPersistentHeader(
            //   pinned: true,
            //   delegate: SliverHeaderDelegate(
            //     height: 120,
            //     child: const SizedBox(),
            //   ),
            // ),
      
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((tab) => tab.content).toList(),
              ),
            )
          ]
      ),
    );
  }
}