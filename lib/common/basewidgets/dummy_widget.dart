import 'package:flutter/material.dart';

class DummyWidget extends StatelessWidget {
  final String text;

  const DummyWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)));
  }
}
