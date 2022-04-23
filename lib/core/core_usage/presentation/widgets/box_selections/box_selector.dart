import 'package:flutter/material.dart';

import '../../configurations/sizes.dart';
import '../options/box_selector.dart';

class BoxesSelection extends StatelessWidget {
  final TextEditingController large;
  final TextEditingController medium;
  final TextEditingController small;
  const BoxesSelection({required this.large, required this.medium, required this.small, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemHeight(30)),
      child: Column(
        children: [
          BoxSelection(
            textEditingController: large,
            text: "Large Box",
          ),
          BoxSelection(
            textEditingController: medium,
            text: "Medium Box",
          ),
          BoxSelection(
            textEditingController: small,
            text: "Small Box",
          ),
        ],
      ),
    );
  }
}