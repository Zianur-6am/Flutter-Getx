// import 'package:flutter/material.dart';
//
//
// class PaginationWithTabs extends StatefulWidget {
//   @override
//   _PaginationWithTabsState createState() => _PaginationWithTabsState();
// }
//
// class _PaginationWithTabsState extends State<PaginationWithTabs>
//     with TickerProviderStateMixin {
//   late TabController _tabController;
//   final List<TabData> _tabs = [
//     TabData(tabLabel: "Tab 1"),
//     TabData(tabLabel: "Tab 2"),
//     TabData(tabLabel: "Tab 3"),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: _tabs.length, vsync: this);
//     // Load initial data for the first tab
//     _loadData(0);
//   }
//
//   Future<void> _loadData(int tabIndex) async {
//     final tab = _tabs[tabIndex];
//     if (tab.isLoading || !tab.hasMore) return;
//
//     tab.isLoading = true;
//     setState(() {});
//
//     // Simulate API call (replace with real data fetching)
//     await Future.delayed(Duration(seconds: 2));
//
//     // Add new items
//     final newItems = List.generate(
//       10,
//           (i) => "${tab.tabLabel} Item ${tab.items.length + i + 1}",
//     );
//
//     tab.items.addAll(newItems);
//     tab.page++;
//     tab.hasMore = tab.page < 3; // Simulate 3 pages of data
//     tab.isLoading = false;
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: NestedScrollView(
//             headerSliverBuilder: (context, innerBoxScrolled) => [
//               SliverAppBar(
//                 title: Text("Pagination with Tabs"),
//                 pinned: true,
//                 floating: true,
//                 snap: true,
//                 bottom: TabBar(
//                   controller: _tabController,
//                   tabs: _tabs.map((tab) => Tab(text: tab.tabLabel)).toList(),
//                 ),
//               ),
//             ],
//             body: TabBarView(
//               controller: _tabController,
//               children: _tabs.map((tab) => _buildTabList(tab)).toList(),
//             )));
//   }
//
//   Widget _buildTabList(TabData tab) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (notification) {
//         if (notification is ScrollEndNotification &&
//             notification.metrics.extentAfter == 0) {
//           // Load more when scrolled to the end
//           _loadData(_tabs.indexOf(tab));
//         }
//         return false;
//       },
//       child: ListView.builder(
//         padding: EdgeInsets.all(8),
//         itemCount: tab.items.length + (tab.hasMore ? 1 : 0),
//         itemBuilder: (context, index) {
//           if (index < tab.items.length) {
//             return ListTile(title: Text(tab.items[index]));
//           } else {
//             return Padding(
//               padding: EdgeInsets.symmetric(vertical: 16),
//               child: Center(
//                 child: tab.hasMore
//                     ? CircularProgressIndicator()
//                     : Text("No more items"),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }
//
// class TabData {
//   final String tabLabel;
//   List<String> items = [];
//   int page = 1;
//   bool isLoading = false;
//   bool hasMore = true;
//
//   TabData({required this.tabLabel});
// }