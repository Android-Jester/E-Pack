import 'package:flutter/material.dart';

import '../configurations/sizes.dart';

class BuildDotsRow extends StatelessWidget {
  const BuildDotsRow({
    Key? key,
    required this.currentPage,
    required this.index,
    required this.length,
  }) : super(key: key);

  final int currentPage;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SizedBox(
      height: itemWidth(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          length,
              (index) => AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.only(right: 5),
            height: 6.0,
            width: currentPage == index ? 20 : 6,
            decoration: BoxDecoration(
              color: currentPage == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ),
      ),
    );
  }
}
