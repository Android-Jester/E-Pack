import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class PageButton extends StatelessWidget {
  final bool isForward;
  final void Function()? function;
  final PageController? controller;
  final bool isDisabled;
  final int pageCount;

  PageButton(
      {Key? key,
      this.function,
      this.isDisabled = false,
      required this.isForward,
      required this.controller,
      required this.pageCount})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return CustomButton(
      onPressed: (isDisabled)
          ? null
          : () {
              function;
              (isForward)
                  ? forward(controller!, pageCount)
                  : backward(controller!, pageCount);
            },
      text: (isForward) ? "Next" : "Previous",
    );
  }
}

void forward(PageController controller, int pageCount) {
  controller.animateToPage(
    pageCount + 1,
    duration: const Duration(milliseconds: 50),
    curve: Curves.easeIn,
  );
}

void backward(PageController controller, int pageCount) {
  controller.animateToPage(
    pageCount - 1,
    duration: const Duration(milliseconds: 50),
    curve: Curves.easeIn,
  );
}
