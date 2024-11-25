import 'package:flutter/material.dart';

class ItemExtentExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ListView with itemExtent')),
      body: ListView.builder(
        itemCount: 10000,
        itemExtent: 70.0, // Each item has a fixed height of 70 pixels
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item ${index + 1}'),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ItemExtentExample()));
}
