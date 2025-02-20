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
    TabItem(title: 'All', content: const DummyWidget(text: "All Tab")),
    TabItem(title: 'Home', content: const ValleyHomeTab()),
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
          floatHeaderSlivers: false, // Ensures headers work correctly
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (context, _){
            return [

              const WelcomeBannerWidget(),

              TabBarValleyHomeWidget(tabController: _tabController, tabs: tabs),

              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: const CustomSearchWidget(horizontalPadding: Dimensions.paddingSizeSmall, verticalPadding: Dimensions.paddingSizeSmall,
                ),
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

class CustomSearchWidget extends StatelessWidget {
  final double horizontalPadding;
  final double verticalPadding;

  const CustomSearchWidget({
    super.key, this.horizontalPadding = 10, this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: SliverHeaderDelegate(
          height: 50,
          child: Container(
            color: Colors.white,
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.1), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.5), width: 1),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
