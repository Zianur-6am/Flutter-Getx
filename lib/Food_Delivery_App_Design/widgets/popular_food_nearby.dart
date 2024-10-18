import 'package:flutter/material.dart';

class PopularFoodNearby extends StatelessWidget {
  const PopularFoodNearby({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        SizedBox(
          child: Container(
            width: 200,
            child: Card(
              child: Column(children: [
                Icon(Icons.home),

                Text('Fried Noodles'),

                Text('Mc Donalds'),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    Text('\$7.56'),

                    Expanded(child: Container(),),

                    Icon(Icons.star, color: Colors.green,),
                    Text('4.9', style: TextStyle(color: Colors.green),),
                  ],),
                )
              ],),
            ),
          ),
        ),

        SizedBox(
          width: 200,
          child: Card(
            child: Column(
              children: [
                // Expanded(flex: 3,
                //   child: Image.asset('assets/images/bangla.png'),),
                Expanded(
                  flex: 2,
                  child: Column(children: [
                    Text('Fried Noodles'),

                    Text('Mc Donalds'),

                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(children: [
                        Text('\$7.56'),
                    
                        Expanded(child: Container(),),
                    
                        Icon(Icons.star, color: Colors.green,),
                        Text('4.9', style: TextStyle(color: Colors.green),),
                      ],),
                    )
                  ],),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
