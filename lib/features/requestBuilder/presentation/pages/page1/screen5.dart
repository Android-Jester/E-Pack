//TODO: collection of location info

import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  bool isGranted = false;
  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: itemHeight(5.0),
          ),
          textWithLabel(text: "Residence Name"),
          textWithLabel(text: "Room or flat number"),
          textWithLabel(text: "Mobile"),
          Divider(),
          textWithLabel(text: "Access Note"),
          textWithLabel(text: "Residence Name"),
          Text(
              "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Checkbox(
                  value: isGranted,
                  onChanged: (val) {
                    isGranted = val!;
                  }),
            ],
          )
        ],
      ),
    );
  }

  Widget textWithLabel({required String? text}) {
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
              child: const TextField(
                  decoration: InputDecoration(border: OutlineInputBorder()))),
        ],
      ),
    );
  }
}
