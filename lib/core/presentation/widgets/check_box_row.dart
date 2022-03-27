import 'package:flutter/material.dart';

class CheckBoxRow extends StatelessWidget {
  final String text;
  final bool checkValue;
  final void Function(bool? val)? function;

  CheckBoxRow({
    required this.text,
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
          Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15.0),
          ),
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
