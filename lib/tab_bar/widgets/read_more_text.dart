import 'package:flutter/material.dart';

class ReadMoreText extends StatelessWidget {
  final String text;
  final int maxLines;

  ReadMoreText({required this.text, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Displaying the text with ellipsis
        Expanded(
          child: Text(
            text,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        // Showing "Read more" if the text overflows
        if (text.length > 100) // You can adjust this length check as needed
          GestureDetector(
            onTap: () {
              // Handle "Read more" click, like expanding the text
              print("Read more clicked");
            },
            child: const Text(
              'Read more',
              style: TextStyle(fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline, decorationColor: Colors.blue),
            ),
          ),
      ],
    );
  }
}
