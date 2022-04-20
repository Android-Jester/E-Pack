

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configurations/sizes.dart';

class BoxSizes extends StatelessWidget {
  const BoxSizes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade200,
      width: Config.width,
      height: Config.height! / 6,
      padding: EdgeInsets.symmetric(horizontal: itemWidth(2.0)),
      child: const Center(
        child: Text(" Size of Large Box: 18”x18”x24” \n Size of Medium Box: 18”x18”x16” \n Size of Small Box: 16”x12”x12” "),
      ),
    );
  }
}

