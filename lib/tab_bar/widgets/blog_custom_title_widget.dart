import 'package:flutter/material.dart';

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