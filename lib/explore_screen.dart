import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool _isLoading = false;
  List<String> _items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);  // 3 tabs
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // This function will trigger the loading of new items when the user scrolls to the bottom.
  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      _loadMoreItems();
    }
  }

  // Simulate loading more data with a time delay and show a loading indicator.
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
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: false,
              expandedHeight: 150.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Header Content',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Home"),
                    Tab(text: "Trending"),
                    Tab(text: "Profile"),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildTabContent("Home Screen", Colors.red),
            _buildTabContent("Trending Screen", Colors.green),
            _buildTabContent("Profile Screen", Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(String title, Color color) {
    return CustomScrollView(
      // controller: _scrollController,
      physics: NeverScrollableScrollPhysics(),
      slivers: [

        SliverPersistentHeader(
          pinned: true, // Header stays visible at top when scrolling
          floating: false, // Set to true for quick header reappearance
          delegate: _CustomSliverDelegate(
            child: Container(
              color: Colors.white, // Header background
              padding: const EdgeInsets.all(16),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            minHeight: 60, // Collapsed height
            maxHeight: 80, // Expanded height
          ),
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return ListTile(title: Text(_items[index]));
            },
            childCount: _items.length,
          ),
        ),
        if (_isLoading)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}

/// SliverPersistentHeader Delegate for TabBar
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

// Custom Delegate Class
class _CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double minHeight;
  final double maxHeight;

  _CustomSliverDelegate({
    required this.child,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent
      ) {
    return SizedBox.expand(child: child);
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(_CustomSliverDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
