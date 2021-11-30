import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

import 'build_bots.dart';

class Delegate extends SliverPersistentHeaderDelegate {
  final int currentPage;
  final List<Widget> pages;
  Delegate({required this.currentPage, required this.pages});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    Config.init(context);
    // TODO: implement build
    return Container(
      color: Colors.white,
      height: maxExtent - shrinkOffset,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: itemHeight(10.0)).copyWith(bottom: itemWidth(6)),
        child: BuildDotsRow(currentPage: currentPage, index: currentPage, length: pages.length),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => itemHeight(20.0);

  @override
  // TODO: implement minExtent
  double get minExtent => itemHeight(5.0);

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => true;
}
