import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class Section extends MultiSliver {
  Section({
    super.key,
    required String title,
    Color headerColor = Colors.white,
    Color titleColor = Colors.black,
    required List<Widget> items,
  }) : super(
    pushPinnedChildren: true,
    children: [
      SliverPinnedHeader(child: ListTile(
        textColor: titleColor,
        title: Text(title),
      )),

      SliverList(
        delegate: SliverChildListDelegate.fixed(items),
      ),
    ],
  );
}