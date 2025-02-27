import 'package:flutter/material.dart';

class TabScrollExample extends StatefulWidget {
  const TabScrollExample({super.key});

  @override
  TabScrollExampleState createState() => TabScrollExampleState();
}

class TabScrollExampleState extends State<TabScrollExample> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> _sectionKeys = List.generate(3, (index) => GlobalKey());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _scrollToSection(int index) {
    final keyContext = _sectionKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverTabBarDelegate(
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(text: "Section 1"),
                  Tab(text: "Section 2"),
                  Tab(text: "Section 3"),
                ],
                onTap:(int index){
                  _scrollToSection(index);
                },
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: List.generate(3, (index) => _buildSection(index)),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(int index) {
    return Container(
      key: _sectionKeys[index],
      padding: EdgeInsets.all(20),
      height: 400, // Just for example, set a height to see the sections clearly
      color: Colors.grey[(index + 1) * 200],
      child: Center(child: Text("Section ${index + 1}", style: TextStyle(fontSize: 24))),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: Colors.white, child: tabBar);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _SliverTabBarDelegate oldDelegate) {
    return false;
  }
}
