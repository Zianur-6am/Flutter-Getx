import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: false, // Ensures headers work correctly
          physics: const ClampingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            _buildWelcomeBanner(), // Scrolls away
            _buildSearchBox(), // Pinned
            _buildTabBar(), // Pinned
          ],
          body: TabBarView(
            children: [
              _buildTabContent(), // Each tab has a pinned inner header
              _buildTabContent(),
            ],
          ),
        ),
      ),
    );
  }

  /// **Welcome Banner (Scrolls away)**
  Widget _buildWelcomeBanner() {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.blue,
        height: 150,
        alignment: Alignment.center,
        child: const Text(
          'Welcome Banner',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  /// **Search Box (Pinned)**
  Widget _buildSearchBox() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverHeaderDelegate(
        height: 60,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }

  /// **TabBar (Pinned)**
  Widget _buildTabBar() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverHeaderDelegate(
        height: 50,
        child: Container(
          color: Colors.white,
          child: const TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
            ],
          ),
        ),
      ),
    );
  }

  /// **Tab Content with Pinned Middle Header**
  Widget _buildTabContent() {
    return NestedScrollView(
      floatHeaderSlivers: false,
      physics: const ClampingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        _buildMiddlePersistentHeader(), // Middle pinned header
      ],
      body: ListView.builder(
        itemCount: 50, // Ensure enough content for scrolling
        itemBuilder: (context, index) => ListTile(
          title: Text('Item $index'),
        ),
      ),
    );
  }

  /// **Pinned Middle Header (Inside Each Tab)**
  Widget _buildMiddlePersistentHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverHeaderDelegate(
        height: 60,
        child: Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text(
            'Middle Header',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

/// **Sliver Header Delegate**
class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _SliverHeaderDelegate({required this.child, this.height = 60});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(height: height, child: child);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
