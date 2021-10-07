import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:flutter/material.dart';

Widget textWithLabel(
    {required String? text, required TextEditingController? controller, TextInputType? type = TextInputType.text}) {
  return Container(
    padding: EdgeInsets.only(top: itemHeight(5.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text!),
        SizedBox(
          height: itemHeight(2.5),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
            child: TextField(
                controller: controller,
                keyboardType: type,
                decoration:
                    const InputDecoration(border: OutlineInputBorder()))),
      ],
    ),
  );
}
