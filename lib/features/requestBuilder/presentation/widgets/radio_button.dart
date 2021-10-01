import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:flutter/material.dart';

Widget selectionRow(
    {required String text,
    required int value,
    required Config config,
    required int? selectedRadio,
    required Function(Object? value) onChanged}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: config.itemWidth(20.0)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text),
      Radio(value: value, groupValue: selectedRadio, onChanged: onChanged)
    ]),
  );
}
