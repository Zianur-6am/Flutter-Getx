import 'package:flutter/material.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/welcome_banner_widget.dart';
import 'package:flutter_getx/helper/tab_class.dart';
import 'package:flutter_getx/tab_bar/widgets/home_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:get/get.dart';

class ValleyHomeScreen extends StatefulWidget {
  const ValleyHomeScreen({super.key});

  @override
  State<ValleyHomeScreen> createState() => _ValleyHomeScreenState();
}

class _ValleyHomeScreenState extends State<ValleyHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<TabItem> tabs = [
    TabItem(title: 'All', content: const SizedBox()),
    TabItem(title: 'Home', content: const HomeTab()),
    TabItem(title: 'Informative', content: const HomeTab()),
    TabItem(title: 'Comparison', content: const HomeTab()),
    TabItem(title: 'Best', content: const HomeTab()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, _){
            return [
              SliverPersistentHeader(
                delegate: _SliverSearchTabBarDelegate(_tabController, tabs, minHeight: 202, maxHeight: 250),
                floating: true,
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: tabs.map((tab) => tab.content).toList(),
          ),
        ),
      ),
    );
  }
}


class _SliverSearchTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final double minHeight;
  final double maxHeight;
  final List<TabItem> tabs;

  _SliverSearchTabBarDelegate(this.tabController, this.tabs, {this.minHeight = 100, this.maxHeight = 200});

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const WelcomeBannerWidget(),

          TabBar(
              tabAlignment: TabAlignment.start,
              physics: const BouncingScrollPhysics(),
              isScrollable: true,

              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeMedium, vertical: 0),
              labelPadding: const EdgeInsets.only(right: Dimensions.paddingSizeExtraLarge, bottom: 0),
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.orange,
              indicatorWeight: 5,
              indicatorPadding: const EdgeInsets.only(bottom: 0),
              dividerColor: Colors.transparent,
              tabs: tabs.map((tab) => Tab(
                child: Text(tab.title, style: TextStyle(color: tabController.index == tabs.indexOf(tab) ? Colors.white : Colors.grey)),
              )).toList()
          ),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
              child: const CustomSearchWidget(),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
            hintText: "What are you looking for?",
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: Container(
              margin: const EdgeInsets.only(top: 2, right: 5, bottom: 2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.search, color: Colors.white,),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.1), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5), width: 1),
            ),
            filled: true,
            fillColor: Colors.white
        ),
      ),
    );
  }
}
