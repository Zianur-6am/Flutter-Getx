import 'package:flutter/material.dart';


class ScrollScreen2Widget extends StatefulWidget {
  const ScrollScreen2Widget({super.key});

  @override
  State<ScrollScreen2Widget> createState() => _ScrollScreen2WidgetState();
}

class _ScrollScreen2WidgetState extends State<ScrollScreen2Widget> {

  final itemSize = 100.0;

  _moveUp() {
    _controller.animateTo(_controller.offset - itemSize,
        curve: Curves.linear, duration: const Duration(milliseconds: 500));
  }
  _moveDown() {
    _controller.animateTo(_controller.offset + itemSize,
        curve: Curves.linear, duration: const Duration(milliseconds: 500));
  }

  late ScrollController _controller;



  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scroll Movement"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            color: Colors.green,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _moveUp,
                    child: const Text("UP"),
                  ),

                  ElevatedButton(
                    onPressed: _moveDown,
                    child: const Text("DOWN"),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: 30,
              itemExtent: itemSize,
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
