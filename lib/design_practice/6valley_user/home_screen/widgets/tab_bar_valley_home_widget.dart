import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/sliver_header_delegate.dart';
import 'package:flutter_getx/helper/tab_class.dart';
import 'package:flutter_getx/utils/dimensions.dart';

class TabBarValleyHomeWidget extends StatelessWidget {
  final TabController tabController;
  final List<TabItem> tabs;


  const TabBarValleyHomeWidget({super.key, required this.tabController, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        height: 50,
        child: Container(
          color: Colors.blue,
          child: TabBar(
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
        ),
      ),
    );
  }
}
