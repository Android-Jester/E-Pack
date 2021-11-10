import 'package:flutter/material.dart';

Widget checkboxRow(
    {required String? text,
    required bool boolean,
    required void Function(bool? val)? function}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text!),
        Checkbox(
          value: boolean,
          onChanged: function,
        ),
      ],
    ),
  );
}
