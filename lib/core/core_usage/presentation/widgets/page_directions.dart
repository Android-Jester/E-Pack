import 'package:flutter/material.dart';

import '../configurations/sizes.dart';



class PageButton extends StatelessWidget {
  final bool isForward;
  final void Function()? onPressed;

  PageButton(
      this.isForward, {
        Key? key,
        required this.onPressed,
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SizedBox(
      width: itemWidth(150.0),
      height: itemHeight(45.0),
      child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateColor.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return Theme.of(context).colorScheme.secondary;
              } else {
                return Colors.black;
              }
            }),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(itemWidth(20.0)),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            (isForward) ? "Next" : "Previous",
            style: Theme.of(context).textTheme.bodyText2,
          )),
    );
  }
}