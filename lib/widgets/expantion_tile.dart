import 'package:flutter/material.dart';
import 'package:flutter_getx/widgets/custom_expansion_tile.dart';

class ExpantionTileExample extends StatefulWidget {
  const ExpantionTileExample({super.key});

  @override
  State<ExpantionTileExample> createState() => _ExpantionTileExampleState();
}

class _ExpantionTileExampleState extends State<ExpantionTileExample> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CustomExpansionTile(
              title: const Text('ExpansionTile 1'),
              subtitle: const Text('Trailing expansion arrow icon'),
              trailing: Icon( _customTileExpanded ? Icons.arrow_drop_down_circle : Icons.arrow_drop_down, size: 40.0,),
              children: const <Widget>[
                ListTile(title: Text('This is tile number 1')),
              ],
              onExpansionChanged: (bool expanded){
                setState(() {
                  _customTileExpanded = expanded;
                });
              },
            ),
            // CustomExpansionTile(
            //   title: const Text('ExpansionTile 2'),
            //   subtitle: const Text('Custom expansion arrow icon'),
            //   trailing: Icon(
            //     _customTileExpanded
            //         ? Icons.arrow_drop_down_circle
            //         : Icons.arrow_drop_down,
            //   ),
            //   children: const <Widget>[
            //     ListTile(title: Text('This is tile number 2 /n jdsfkjsdf /n jlskdfjsdlkfjsd /n dsflskfjs')),
            //   ],
            //   onExpansionChanged: (bool expanded) {
            //     setState(() {
            //       _customTileExpanded = expanded;
            //     });
            //   },
            // ),
            // const CustomExpansionTile(
            //   title: Text('ExpansionTile 3'),
            //   subtitle: Text('Leading expansion arrow icon'),
            //   controlAffinity: ListTileControlAffinity.leading,
            //   children: <Widget>[
            //     ListTile(title: Text('This is tile number 3')),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
