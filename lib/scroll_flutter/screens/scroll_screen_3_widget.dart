import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getx/utils/dimensions.dart';

class ScrollScreen3Widget extends StatefulWidget {
  const ScrollScreen3Widget({super.key});

  @override
  State<ScrollScreen3Widget> createState() => _ScrollScreen3WidgetState();
}

class _ScrollScreen3WidgetState extends State<ScrollScreen3Widget> {

  String message = "Scroll Down to see result";

  late ScrollController _controller;

  _onStartScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Start";
    });
  }
  _onUpdateScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll Update";
    });
  }
  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      message = "Scroll End";
    });
  }



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
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollStartNotification) {
                  _onStartScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollUpdateNotification) {
                  _onUpdateScroll(scrollNotification.metrics);
                } else if (scrollNotification is ScrollEndNotification) {
                  _onEndScroll(scrollNotification.metrics);
                }

                /// Using scroll metrics and pixels
                if (scrollNotification.metrics.pixels >= scrollNotification.metrics.maxScrollExtent){
                  log('----------reached BOTTOM---------------');
                }

                return false;
              },
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("Index : $index"));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}


