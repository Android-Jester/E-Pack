import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function()? onPressed;

  CustomButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return TextButton(
        style: ButtonStyle(
          foregroundColor:
              MaterialStateColor.resolveWith((states) => Colors.grey),
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
        child: Text(text!),
        onPressed: onPressed);
  }
}
