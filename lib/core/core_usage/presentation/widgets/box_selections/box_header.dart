import 'package:flutter/material.dart';

import '../../configurations/sizes.dart';

class BoxHeader extends StatelessWidget {
  const BoxHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Select",
          style: Theme.of(context).textTheme.headline1,
        ),
        const Divider(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: itemHeight(20)),
          child: Divider(
            color: Colors.black,
            thickness: itemHeight(0.5),
            height: itemHeight(1.5),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
          child: Text(
            "Please choose the particular type and number of boxes you may need for your belongings",
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),

      ],
    );
  }
}