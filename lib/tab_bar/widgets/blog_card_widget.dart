import 'package:flutter/material.dart';
import 'package:flutter_getx/tab_bar/widgets/read_more_text.dart';

class BlogCardWidget extends StatelessWidget {
  const BlogCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black.withValues(alpha: .07),
          )
        ],
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: [

        ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset('assets/images/blog_image.png', height: 150, width: double.infinity, fit: BoxFit.cover,),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.grey),
              ),
              child: const Text('Alternative', style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 10),

            const Text('eCommerce Ecosystem: The Complete Guide', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),


            const ReadMoreText(
              maxLines: 2,
              text: 'Your very long text sdgf dsg fds sdf gdfg dfd  dfgdfg df sg gd dfg fd gdfs gsd dfg fdgs gdfdg dfg fd df dsf ds ',
            ),
            const SizedBox(height: 30),

            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text.rich(TextSpan(children: [
                TextSpan(text: 'by '),
                TextSpan(text: 'Devid Miler', style: TextStyle(decoration: TextDecoration.underline, color: Colors.black)),
              ])),

              Text('Today'),
            ]),
            const SizedBox(height: 10),
          ]),
        )
      ]),
    );
  }
}