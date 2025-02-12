import 'package:flutter/material.dart';
import 'package:flutter_getx/tab_bar/widgets/read_more_text.dart';
import 'package:get/get.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;



  final List<TabItem> tabs = [
    TabItem(title: 'Home', content: const HomeTab()),
    TabItem(title: 'All', content: const HomeTab()),
    TabItem(title: 'Informative', content: const HomeTab()),
    TabItem(title: 'Comparison', content: const HomeTab()),
    TabItem(title: 'Best', content: const HomeTab()),
    TabItem(title: 'Favorites', content: FavoritesTab()),
    TabItem(title: 'Settings', content: SettingsTab()),
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


// Define a model to hold tab data
class TabItem {
  final String title;
  final Widget content;

  TabItem({required this.title, required this.content});
}



// Different designs for each tab
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const BlogCardWidget();
              },
            ),
          ),
        ),

        const SliverToBoxAdapter(child: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            Text('See More', style: TextStyle(color: Colors.blue, fontSize: 16)),
            SizedBox(width: 5),

            Icon(Icons.keyboard_arrow_down, color: Colors.blue),
          ]),
        )),

        SliverToBoxAdapter(
          child: Container(
            height: 180,
            padding: const EdgeInsets.all(15),
            color: Colors.blue.withValues(alpha: .1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const CustomTitleWidget(),

                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 50,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const RecentPostCardWidget();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ]
    );
  }
}

class BlogCardWidget extends StatelessWidget {
  const BlogCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withValues(alpha: .07),
          )
        ],
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
            
        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset('assets/images/blog_image.png', height: 150, width: double.infinity, fit: BoxFit.cover,),
        ),
            
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey),
              ),
              child: const Text('Alternative', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 10),
            
            const Text('eCommerce Ecosystem: The Complete Guide', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),

            ReadMoreText(
              text: 'A Lorem Ipsum is simply dummy text  the printing and typesetting industry Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque porta pulvinar leo in sagittis. Nam vestibulum',
              maxLines: 3,
            ),
            const SizedBox(height: 30),
            
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: 'by '),
                TextSpan(text: 'Devid Miler', style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
              ])),
            
              Text('Today'),
            ]),
            const SizedBox(height: 10),
            
          ]),
        )
      ]),
    );
  }
}

class RecentPostCardWidget extends StatelessWidget {
  const RecentPostCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width *.8,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withValues(alpha: .07),
          )
        ],
      ),
      child: Row(mainAxisSize: MainAxisSize.min,children: [

        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset('assets/images/laptop_image.png', width: 80, height: 80, fit: BoxFit.cover,),
        ),

        const Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Top Benefits of Using a POS System',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 20),

                Text('23 Oct, 2024'),
              ],
          ),
        )
      ]),
    );
  }
}

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      child: const Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Text('Recent Posts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
    
        Text('View all', style: TextStyle(color: Colors.blue)),
      ]),
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


// Persistent Header Delegate for Search Box + TabBar
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
          fillColor: Colors.white,
        ),
      ),
    );
  }
}


