import 'package:flutter/material.dart';

class CheckBoxRow extends StatelessWidget {
  final Widget? text;
  final String? textInput;
  final bool checkValue;
  final void Function(bool? val)? function;

  CheckBoxRow({
    this.text,
    this.textInput,
    required this.function,
    required this.checkValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (text == null) ? Text(
            textInput!,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15.0),
          ) : text!,
          Checkbox(
            checkColor: Theme.of(context).colorScheme.primary,
            activeColor: Theme.of(context).colorScheme.primary,
            fillColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
            value: checkValue,
            onChanged: function,
          ),
        ],
      ),
    );
  }
}
