import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';

// class Selector extends StatefulWidget {
//   final String name;
//   final int index;
//   Selector({Key? key,
//     required this.name,
//     required this.index,
// }) : super(key: key);

//   @override
//   State<Selector> createState() => _SelectorState();
// }

// class _SelectorState extends State<Selector> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return SizedBox(
//       child: Row(
//        children: [
//          Text(
//              widget.name,
//            style: Theme.of(context).textTheme.bodyText2,
//          ),
//          const Spacer(),
//          Container(
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(itemWidth(30.0)),
//              color: Colors.red[200],
//            ),
//            child: IconButton(
//                onPressed: () {
//                  setState(() {
//                    (isLeft)
//                        ? (widget.index > 0)
//                        ? widget.textEditingController!.text = (value - 1).toString()
//                        : null
//                        : widget.textEditingController!.text = (value + 1).toString();
//                  });
//                },
//                icon: (isLeft) ? const Icon(Icons.remove) : const Icon(Icons.add)),
//          ),
//        ]
//       ),
//     );
//   }
// }