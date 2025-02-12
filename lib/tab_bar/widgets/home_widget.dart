import 'package:flutter/material.dart';
import 'package:flutter_getx/tab_bar/screens/blog_screen.dart';
import 'package:flutter_getx/tab_bar/widgets/blog_card_widget.dart';
import 'package:flutter_getx/tab_bar/widgets/blog_custom_title_widget.dart';
import 'package:flutter_getx/tab_bar/widgets/recent_post_card_widget.dart';

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