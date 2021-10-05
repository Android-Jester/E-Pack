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
      height: 150.0,
      width: Config.width,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40.0))))),
              onPressed: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.symmetric(
                        vertical: itemHeight(5.0), horizontal: itemWidth(10.0))
                    .copyWith(left: 20.0),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          BuildDotsRow(
              currentPage: currentPage,
              index: currentPage,
              length: pages.length),
        ],
      ),
    );
  }
}
