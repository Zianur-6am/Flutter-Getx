import 'package:flutter/material.dart';

class UnknownRoute extends StatelessWidget {
  const UnknownRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page not found"),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://media.istockphoto.com/id/1533812992/vector/404-error-and-page-not-found-banner-cable-socket-and-plug-system-error-broken-page.jpg?s=612x612&w=0&k=20&c=-THePL6ctYJvKB4wqgnpOxynxiKIQq_ZlsA5iLS699A=",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),

    );
  }
}
