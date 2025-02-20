import 'package:flutter/material.dart';
import 'package:flutter_getx/common/basewidgets/custom_singlechild_listview_widget.dart';
import 'package:flutter_getx/tab_bar/controllers/tab_controller.dart';
import 'package:flutter_getx/tab_bar/widgets/blog_card_widget.dart';
import 'package:flutter_getx/tab_bar/widgets/blog_custom_title_widget.dart';
import 'package:flutter_getx/tab_bar/widgets/recent_post_card_widget.dart';
import 'package:flutter_getx/utils/dimensions.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}



class _HomeTabState extends State<HomeTab> {

  final HomeController homeController = Get.put(HomeController());


  @override
  void initState() {
    Get.find<HomeController>().initialBlogCount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        slivers: [
          GetBuilder<HomeController>(builder: (homeController){
            return homeController.blogCount != 0 ?
            SliverPadding(
              padding: const EdgeInsets.all(Dimensions.paddingSizeMedium),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index){
                    return const BlogCardWidget();
                  },
                  childCount: homeController.blogCount,
                ),
              ),
            ) : const SizedBox.shrink();
          }),


          SliverToBoxAdapter(child: InkWell(
            onTap: (){
              homeController.increaseBlogCount();
            },
            child: const Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              Text('See More', style: TextStyle(color: Colors.blue, fontSize: 16)),
              SizedBox(width: 5),

              Icon(Icons.keyboard_arrow_down, color: Colors.blue),
            ]),
          )),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.blue.withValues(alpha: 0.1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  const CustomTitleWidget(),


                  CustomSingleChildListViewWidget(
                    itemCount: 5,
                    directionVertical: false,
                    itemBuilder: (context, index){
                      return const RecentPostCardWidget();
                    },
                  ),
                ],
              ),
            ),
          )
        ]
    );
  }
}