import 'package:flutter/material.dart';
import 'package:flutter_getx/tab_bar/controllers/tab_controller.dart';
import 'package:flutter_getx/tab_bar/widgets/blog_card_widget.dart';
import 'package:flutter_getx/tab_bar/widgets/blog_custom_title_widget.dart';
import 'package:flutter_getx/tab_bar/widgets/recent_post_card_widget.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}



class _HomeTabState extends State<HomeTab> {

  final TabControllerX tabControllerX = Get.put(TabControllerX());


  @override
  void initState() {
    Get.find<TabControllerX>().initialBlogCount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: GetBuilder<TabControllerX>(
              builder: (tabControllerX) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: ListView.builder(
                    itemCount: tabControllerX.blogCount,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const BlogCardWidget();
                    },
                  ),
                );
              }
            ),
          ),

          SliverToBoxAdapter(child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: (){
                tabControllerX.increaseBlogCount();
              },
              child: const Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                Text('See More', style: TextStyle(color: Colors.blue, fontSize: 16)),
                SizedBox(width: 5),

                Icon(Icons.keyboard_arrow_down, color: Colors.blue),
              ]),
            ),
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