import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

Widget textWithLabel(
    {required String? text,
    required TextEditingController? controller,
    TextInputType? type = TextInputType.text,
    required String? Function(String? str)? validate}) {
  return Container(
    padding: EdgeInsets.only(top: itemHeight(15.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text!),
        SizedBox(
          height: itemHeight(2.5),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
            child: TextFormField(
                validator: validate,
                controller: controller,
                keyboardType: type,
                decoration:
                    const InputDecoration(border: OutlineInputBorder()))),
      ],
    ),
  );
}
