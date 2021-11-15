import 'package:flutter/material.dart';

Widget checkboxRow(
    {required String? text,
    required bool boolean,
    required BuildContext context,
    required void Function(bool? val)? function}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text!,
          style:
              Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 15.0),
        ),
        Checkbox(
          value: boolean,
          onChanged: function,
        ),
      ],
    ),
  );
}
