import 'package:flutter/material.dart';
import 'package:flutter_getx/scroll_flutter/screens/scroll_screen_1_widget.dart';
import 'package:flutter_getx/scroll_flutter/screens/scroll_screen_2_widget.dart';
import 'package:flutter_getx/scroll_flutter/screens/scroll_screen_3_widget.dart';

class MainScrollScreen extends StatefulWidget {
  const MainScrollScreen({super.key});

  @override
  State<MainScrollScreen> createState() => _MainScrollScreenState();
}

class _MainScrollScreenState extends State<MainScrollScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const ScrollScreen1Widget(),
    const ScrollScreen2Widget(),
    const ScrollScreen3Widget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBarWidget(title: 'ScrollController and ScrollNotification'),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.screenshot_outlined), label: 'Scroll Limit Reached'),
          BottomNavigationBarItem(icon: Icon(Icons.screenshot_outlined), label: 'Scroll Movement', ),
          BottomNavigationBarItem(icon: Icon(Icons.screenshot_outlined), label: 'Scroll Status'),
        ],
      ),
    );
  }
}
