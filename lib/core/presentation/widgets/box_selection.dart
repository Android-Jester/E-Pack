import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

class BoxSelection extends StatefulWidget {
  final String? text;
  final TextEditingController? textEditingController;

  const BoxSelection({
    Key? key,
    required this.text,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _boxSelectionState createState() => _boxSelectionState();
}

class _boxSelectionState extends State<BoxSelection> {
  Widget button({bool isLeft = true, required int value}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(itemWidth(30.0)),
        color: Colors.red[200],
      ),
      child: IconButton(
          // onPressed: widget.onChanged,
          onPressed: () {
            setState(() {
              (isLeft)
                  ? (value > 0)
                      ? widget.textEditingController!.text = (value - 1).toString()
                      : null
                  : widget.textEditingController!.text = (value + 1).toString();
            });
          },
          icon: (isLeft) ? const Icon(Icons.remove) : const Icon(Icons.add)),
    );
  }

  @override
  Widget build(BuildContext context) {
    int value = int.parse(widget.textEditingController!.text);
    Config.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(10.0)).copyWith(top: itemWidth(10.0)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: itemWidth(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: itemWidth(180),
              child: Text(
                widget.text!,
                softWrap: true,
              ),
            ),
            Row(
              children: [
                button(value: value),
                SizedBox(width: itemWidth(5.0)),
                Container(
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
