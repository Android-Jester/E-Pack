import 'package:flutter/material.dart';

import '../configurations/sizes.dart';
import 'build_dots.dart';

class Delegate extends SliverPersistentHeaderDelegate {
  final int currentPage;
  final List<Widget> pages;
  Delegate({required this.currentPage, required this.pages});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    Config.init(context);
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: maxExtent - shrinkOffset,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: itemHeight(10.0)).copyWith(bottom: itemWidth(6)),
        child: BuildDotsRow(currentPage: currentPage, index: currentPage, length: pages.length),
      ),
    );
  }

  @override
  double get maxExtent => itemHeight(20.0);

  @override
  double get minExtent => itemHeight(5.0);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
