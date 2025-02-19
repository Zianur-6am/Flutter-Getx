import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NestedScrollViewExample(),
    );
  }
}

class NestedScrollViewExample extends StatefulWidget {
  @override
  _NestedScrollViewExampleState createState() =>
      _NestedScrollViewExampleState();
}

class _NestedScrollViewExampleState extends State<NestedScrollViewExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NestedScrollView with Tabs'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Scrollable Tab'),
            Tab(text: 'Non-scrollable Tab'),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Scroll Header Content Here',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(

          controller: _tabController,
          children: [
            // Scrollable tab content
            SingleChildScrollView(
              child: Column(
                children: List.generate(100, (index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                }),
              ),
            ),
            
            // Non-scrollable tab content
            Column(mainAxisSize: MainAxisSize.min,
              children: List.generate(10, (index) {
                return ListTile(
                  title: Text('Static Item $index'),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
