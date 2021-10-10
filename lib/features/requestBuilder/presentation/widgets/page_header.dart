import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';
import 'build_bots.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
    required this.currentPage,
    required this.pages,
  }) : super(key: key);

  final int currentPage;
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight(100.0),
      width: Config.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/box.jpg"), fit: BoxFit.cover),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: itemWidth(30.0),
                child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new)),
              ),),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: itemHeight(8.0)),
            child: BuildDotsRow(
                currentPage: currentPage,
                index: currentPage,
                length: pages.length),
          ),
        ],
      ),
    );
  }
}
