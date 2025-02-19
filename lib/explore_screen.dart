import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late TabController _primaryTabController;
  late TabController _secondaryTabController;

  @override
  void initState() {
    super.initState();
    _primaryTabController = TabController(length: 3, vsync: this);
    _secondaryTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: _SliverSearchBarDelegate(),
              ),
              SliverPersistentHeader(
                // floating: true,
                pinned: true,
                delegate: _SliverTabBarDelegate(
                  TabBar(
                    controller: _primaryTabController,
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
            controller: _primaryTabController,
            children: [
              _buildScrollableContent(),
              Center(child: Text("Trending Content")),
              Center(child: Text("Profile Content")),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScrollableContent() {
    return CustomScrollView(
      slivers: [
        _buildHorizontalSection("Section 1"),
        _buildHorizontalSection("Section 2"),
        _buildHorizontalSection("Section 3"),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverTabBarDelegate(
            TabBar(
              controller: _secondaryTabController,
              tabs: [
                Tab(text: "Tab A"),
                Tab(text: "Tab B"),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            controller: _secondaryTabController,
            children: [
              Center(child: Text("Tab A Content")),
              Center(child: Text("Tab B Content")),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalSection(String title) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 120,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _primaryTabController.dispose();
    _secondaryTabController.dispose();
    super.dispose();
  }
}

class _SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;
  @override
  double get minExtent => 60;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

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
