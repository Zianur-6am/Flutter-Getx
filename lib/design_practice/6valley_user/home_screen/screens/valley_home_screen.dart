import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/dummy_widget.dart';
import 'package:flutter_getx/common/basewidgets/sliver_header_delegate.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/tab_bar_valley_home_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/valley_home_tab_widget.dart';
import 'package:flutter_getx/design_practice/6valley_user/home_screen/widgets/welcome_banner_widget.dart';
import 'package:flutter_getx/helper/tab_class.dart';
import 'package:flutter_getx/tab_bar/widgets/home_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';

class ValleyHomeScreen extends StatefulWidget {
  const ValleyHomeScreen({super.key});

  @override
  State<ValleyHomeScreen> createState() => _ValleyHomeScreenState();
}

class _ValleyHomeScreenState extends State<ValleyHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<TabItem> tabs = [
    TabItem(title: 'Explore', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Sports', content: const ValleyHomeTab()),
    TabItem(title: 'Womens', content: const HomeTab()),
    TabItem(title: 'Kids', content: const HomeTab()),
    TabItem(title: 'Wigs', content: const HomeTab()),
    TabItem(title: 'Electronics', content: const HomeTab()),
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
          floatHeaderSlivers: false, // Ensures headers work correctly
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (context, _){
            return [

              const WelcomeBannerWidget(),

              SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: TabBarValleyHomeWidget(tabController: _tabController, tabs: tabs),
              ),

              const CustomSearchWidget(horizontalPadding: Dimensions.paddingSizeSmall, verticalPadding: Dimensions.paddingSizeSmall),

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

class CustomSearchWidget extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;

  const CustomSearchWidget({
    super.key, this.horizontalPadding = 10, this.verticalPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        height: 70,
        child: Container(
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
        ),
      ),
    );
  }
}
