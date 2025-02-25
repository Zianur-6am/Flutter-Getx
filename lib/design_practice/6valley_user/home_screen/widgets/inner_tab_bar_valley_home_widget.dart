import 'package:flutter/material.dart';

class InnerTabBarValleyHomeWidget extends StatelessWidget {
  final int? index;
  final bool selectedTab;
  final String title;


  const InnerTabBarValleyHomeWidget({super.key, this.index, this.selectedTab = false, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: selectedTab ? Theme.of(context).primaryColor : Theme.of(context).hintColor.withValues(alpha: 0.05),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
        color: selectedTab ? Theme.of(context).primaryColor : Theme.of(context).hintColor.withValues(alpha: 0.5),

      ),
      child: Center(child: Text(title, style: TextStyle(color: selectedTab ? Theme.of(context).cardColor : Theme.of(context).hintColor.withValues(alpha: .5)),)),
    );
  }
}
