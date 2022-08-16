import '../configurations/sizes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;
  final Color? color;
  final double width, height;

  const CustomButton({
    this.width = 140,
    this.height = 70,
    this.color = Colors.blue,
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: itemWidth(width),
      height: itemHeight(height),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateColor.resolveWith((states) {
            // if (states.isNotEmpty) {
            //   switch (states.first) {
            //     case MaterialState.disabled:
            //       return Theme.of(context).colorScheme.tertiary;
            //     case MaterialState.error:
            //       return Theme.of(context).colorScheme.error;
            //     default:
            //       return Theme.of(context).colorScheme.primaryContainer;
            //   }
            // } else {
              return Theme.of(context).colorScheme.primaryContainer;
            // }
          }),
        ),
        onPressed: onPressed,
        child: Text(
          text!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white,
                fontSize: itemWidth(20.0),
              ),
        ),
      ),
    );
  }
}
