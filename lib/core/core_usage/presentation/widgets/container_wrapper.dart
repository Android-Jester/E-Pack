
import 'package:flutter/material.dart';

import '../configurations/sizes.dart';

class ContainerWrapper extends StatelessWidget {
  final Widget? child;
  final EdgeInsets padding;
  final double? width;
  final double? height;

  const ContainerWrapper({
    this.width,
    this.height,
    Key? key,
    required this.child,
    // required this.color,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        padding: padding,
        margin: EdgeInsets.symmetric(
          horizontal: itemWidth(15.0),
        ),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(itemWidth(15.0)), boxShadow: const [
          BoxShadow(
            offset: Offset(2, 3),
            color: Colors.black12,
            blurRadius: 2,
          )
        ]),
        child: child);
  }
}
