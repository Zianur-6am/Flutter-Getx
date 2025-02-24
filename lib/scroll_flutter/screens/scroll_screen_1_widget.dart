import 'package:flutter/material.dart';
import 'package:flutter_getx/utils/dimensions.dart';

class ScrollScreen1Widget extends StatefulWidget {
  const ScrollScreen1Widget({super.key});

  @override
  State<ScrollScreen1Widget> createState() => _ScrollScreen1WidgetState();
}

class _ScrollScreen1WidgetState extends State<ScrollScreen1Widget> {

  String message = "Scroll Down to reach limit";

  late ScrollController _controller;



  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "Reached the BOTTOM";
      });
    }
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        message = "Reached the TOP";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scroll Limit reached"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.green,
            child: Center(
              child: Text(message, style: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: Dimensions.fontSizeLarge,
              fontWeight: FontWeight.bold,
            )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: 30,
              itemBuilder: (context, index) {
                return ListTile(title: Text("Index : $index"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
