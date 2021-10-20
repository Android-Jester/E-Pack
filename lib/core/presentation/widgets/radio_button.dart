import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class PageButton extends StatelessWidget {
  final bool isForward;

  final PageController? controller;
  final int pageCount;

  PageButton(
      {Key? key,
      required this.isForward,
      required this.controller,
      required this.pageCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int currentPage = pageCount;
    Config.init(context);
    return CustomButton(
      onPressed: () {
        controller!.animateToPage((isForward) ? currentPage++ : currentPage--,
            duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
      },
      text: (isForward) ? "Next" : "Previous",
    );
  }
}
