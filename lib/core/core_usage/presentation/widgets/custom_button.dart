
import 'package:flutter/material.dart';

import '../configurations/sizes.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final bool isDisabled;
  final Color? color;
  final double width;

  CustomButton({this.width = 140, this.color, Key? key, this.isDisabled = false, required this.text, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: itemHeight(50),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Colors.grey;
              } else if (states.contains(MaterialState.disabled)) {
                return Theme.of(context).colorScheme.background;
              } else {
                return Theme.of(context).colorScheme.primary;
              }
            }),
          ),
          child: Text(
            text!,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white, fontSize: itemWidth(25.0)),
          ),
          onPressed: (isDisabled) ? null : onPressed),
    );
  }
}
