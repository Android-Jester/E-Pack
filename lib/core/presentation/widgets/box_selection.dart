import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

class BoxSelection extends StatefulWidget {
  final String? text;
  final TextEditingController? textEditingController;
  const BoxSelection(
      {Key? key, required this.text, required this.textEditingController})
      : super(key: key);

  @override
  State<BoxSelection> createState() => _BoxSelectionState();
}

class _BoxSelectionState extends State<BoxSelection> {
  @override
  Widget build(BuildContext context) {
    int counted = int.parse(widget.textEditingController!.text);

    Config.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(10.0))
          .copyWith(top: itemWidth(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.text!),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(itemWidth(20.0)),
                  color: Colors.red,
                ),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (counted > 0) {
                          counted -= 1;
                        }
                        widget.textEditingController!.text = counted.toString();
                      });
                    },
                    icon: const Icon(Icons.remove)),
              ),
              Container(
                  width: itemWidth(40.0),
                  height: itemHeight(20.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    controller: widget.textEditingController,
                  )),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(itemWidth(20.0)),
                    color: Colors.red,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          counted += 1;
                          widget.textEditingController!.text =
                              counted.toString();
                        });
                      },
                      icon: const Icon(Icons.add))),
            ],
          )
        ],
      ),
    );
  }
}
