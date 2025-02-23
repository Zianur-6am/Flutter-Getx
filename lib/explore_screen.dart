import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class ListPage extends StatelessWidget {
  const ListPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List"),
        ),
        body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  _BodyState();

  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          var position = itemPositionsListener.itemPositions.value.first.index;
          print(position);
          //trigger leaving and use own data
          Navigator.pop(context, false);

          //we need to return a future
          return Future.value(false);
        },
        child: ScrollablePositionedList.builder(
            initialScrollIndex: 69,
            itemPositionsListener: itemPositionsListener,
            itemCount: 500,
            itemBuilder: (context, index) => Text('Item $index')));
  }
}