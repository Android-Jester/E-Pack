import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String? text1;
  final String? text2;
  final String? text3;
  final void Function() onPressed;
  const SelectionButton({
    Key? key,
    this.text1,
    this.text2,
    this.text3,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(itemHeight(10.0)),
      child: OutlinedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.all(Radius.circular(itemWidth(20.0)))))),
        onPressed: onPressed,
        child: Container(
          width: Config.width,
          padding: EdgeInsets.symmetric(horizontal: itemWidth(30.0)),
          child: Column(
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(text: "$text1 \n"),
                    TextSpan(text: "$text2 \n"),
                    TextSpan(text: " $text3 \n"),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}
