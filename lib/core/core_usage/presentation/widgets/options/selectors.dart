import 'package:flutter/material.dart';

import '../../configurations/sizes.dart';

class Selectors extends StatefulWidget {
  final String name;
  final TextEditingController textEditingController;

  const Selectors({
    Key? key,
    required this.name,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _boxSelectionState createState() => _boxSelectionState();
}

class _boxSelectionState extends State<Selectors> {
  Widget button({bool isLeft = true, required int value}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(itemWidth(30.0)),
        color: Colors.red[200],
      ),
      child: IconButton(
          onPressed: () {
            setState(() {
              (isLeft)
                  ? (value > 0)
                      ? widget.textEditingController.text =
                          (value - 1).toString()
                      : null
                  : widget.textEditingController.text = (value + 1).toString();
            });
          },
          icon: (isLeft) ? const Icon(Icons.remove) : const Icon(Icons.add)),
    );
  }

  @override
  Widget build(BuildContext context) {
    int value = int.parse(widget.textEditingController.text);
    Config.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(10.0))
          .copyWith(top: itemWidth(10.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: itemWidth(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: itemWidth(180),
              child: Text(
                widget.name,
                softWrap: true,
              ),
            ),
            Row(
              children: [
                button(value: value),
                SizedBox(width: itemWidth(5.0)),
                SizedBox(
                    width: itemWidth(40.0),
                    height: itemHeight(20.0),
                    child: TextField(
                      textAlign: TextAlign.center,
                      readOnly: true,
                      controller: widget.textEditingController,
                    )),
                SizedBox(width: itemWidth(5.0)),
                button(isLeft: false, value: value),
              ],
            )
          ],
        ),
      ),
    );
  }
}
