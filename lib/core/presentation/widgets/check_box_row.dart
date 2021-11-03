import 'package:flutter/material.dart';

Row checkboxRow(
    {required String? text,
    required bool boolean,
    required void Function(bool? val)? function}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(text!),
      Checkbox(
          value: boolean,
          onChanged: 
            function,),
    ],
  );
}
