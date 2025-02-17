import 'package:flutter/material.dart';

class RecentPostCardWidget extends StatelessWidget {
  const RecentPostCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: MediaQuery.sizeOf(context).width *.8, minWidth: MediaQuery.sizeOf(context).width *.5),
      margin: const EdgeInsets.only(right: 20),
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
      child: Row(mainAxisSize: MainAxisSize.min,children: [

        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.asset('assets/images/laptop_image.png', fit: BoxFit.cover),
        ),

        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Top Benefits of Using a POS System',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 20),

              Text('23 Oct, 2024', maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ]),
    );
  }
}