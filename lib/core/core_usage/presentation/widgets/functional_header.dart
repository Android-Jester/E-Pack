import 'package:flutter/material.dart';

import '../configurations/sizes.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.title,
    required this.mainTitle,
  }) : super(key: key);
  final String mainTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Config.width,
      decoration: const BoxDecoration(image: DecorationImage(opacity: 0.4, image: AssetImage('assets/images/box.jpg'), fit: BoxFit.fill)),
      padding: EdgeInsets.all(itemWidth(15)),
      margin: EdgeInsets.symmetric(vertical: itemWidth(15)),
      child: Column(
        children: [
          SizedBox(
            height: itemHeight(20),
          ),
          Text(
            mainTitle,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(
            height: itemHeight(150),
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
