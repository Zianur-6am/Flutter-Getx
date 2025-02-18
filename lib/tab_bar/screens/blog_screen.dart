import 'package:flutter/material.dart';
import 'package:flutter_getx/tab_bar/widgets/home_widget.dart';
import 'package:get/get.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;



  final List<TabItem> tabs = [
    TabItem(title: 'All', content: const HomeTab()),
    TabItem(title: 'Home', content: const HomeTab()),
    TabItem(title: 'Informative', content: const HomeTab()),
    TabItem(title: 'Comparison', content: const HomeTab()),
    TabItem(title: 'Best', content: const HomeTab()),
    TabItem(title: 'Favorites', content: const FavoritesTab()),
    TabItem(title: 'Settings', content: const SettingsTab()),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, _){
          return [
            SliverAppBar(
              leading: InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back_ios)
              ),
              title: const Text("Blog", style: TextStyle(fontSize: 16)),
              centerTitle: true,
              pinned: true,
            ),

            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverPersistentHeader(
                delegate: _SliverSearchTabBarDelegate(_tabController, tabs),
                floating: true,
                pinned: true,
              ),
            ),

          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: tabs.map((tab) => tab.content).toList(),
        ),
      ),
    );
  }
}



class TabItem {
  final String title;
  final Widget content;

  TabItem({required this.title, required this.content});
}



class _SliverSearchTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  final List<TabItem> tabs;

  _SliverSearchTabBarDelegate(this.tabController, this.tabs);

  @override
  double get minExtent => 140;
  @override
  double get maxExtent => 250;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Search Box
          const CustomSearchWidget(),
          const SizedBox(height: 15),

          // TabBar
          TabBar(
              tabAlignment: TabAlignment.start,
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              padding: EdgeInsets.zero,
              controller: tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              indicator: const BoxDecoration(
                color: Colors.transparent, // Makes the indicator transparent
              ),
              indicatorWeight: 0,
              dividerColor: Colors.transparent,
              tabs: tabs.map((tab) => Tab(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: tabController.index == tabs.indexOf(tab) ? Colors.blue : null,
                      border: Border.all(color: tabController.index == tabs.indexOf(tab) ? Colors.blue : Colors.grey, width: 1)
                  ),
                  child: Text(tab.title, style: TextStyle(color: tabController.index == tabs.indexOf(tab) ? Colors.white : Colors.grey)),
                ),
              )).toList()
          ),
          const SizedBox(height: 5),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search Products",
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
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Theme.of(context).primaryColor.withValues(alpha: .04)
        ),
      ),
    );
  }
}












class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 50,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Favorite Item ${index + 1}'),
        );
      },
    );
  }
}

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(50, (index) {
        return Card(
          margin: const EdgeInsets.all(10),
          child: Center(
            child: Text('Setting ${index + 1}', style: TextStyle(fontSize: 18)),
          ),
        );
      }),
    );
  }
}


