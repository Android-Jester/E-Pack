import 'package:flutter/material.dart';

Row checkboxRow({required String? text, required bool boolean}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(text!),
      Checkbox(
          value: boolean,
          onChanged: (val) {
            boolean = val!;
          }),
    ],
  );
}

