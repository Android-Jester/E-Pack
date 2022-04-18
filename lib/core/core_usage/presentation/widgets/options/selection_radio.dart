
import 'package:flutter/material.dart';

import '../../configurations/sizes.dart';

class SelectionRadio extends StatelessWidget {
  final String? text;
  final int value;
  final int? groupValue;
  final void Function(int?)? changed;

  SelectionRadio({required this.text, required this.value, required this.groupValue, required this.changed});

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)).copyWith(top: itemHeight(15.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text!),
        Radio<int>(
          hoverColor: Theme.of(context).colorScheme.primary,
          activeColor: Theme.of(context).colorScheme.primary,
          fillColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary),
          value: value,
          groupValue: groupValue,
          onChanged: changed,
        ),
      ]),
    );
  }
}
