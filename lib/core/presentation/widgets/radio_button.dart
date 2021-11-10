import 'package:e_pack/core/presentation/config/config.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class PageButton extends StatelessWidget {
  final bool isForward;
  final void Function()? onPressed;

  PageButton(
    this.isForward, {
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return CustomButton(
      onPressed: onPressed,
      text: (isForward) ? "Next" : "Previous",
    );
  }
}

void direction(PageController controller, int pageCount,
    [bool isForward = false]) {
  controller.animateToPage(
    (isForward) ? pageCount + 1 : pageCount - 1,
    duration: const Duration(milliseconds: 50),
    curve: Curves.easeIn,
  );
}

// void backward(PageController controller, int pageCount) {
//   controller.animateToPage(
//     pageCount - 1,
//     duration: const Duration(milliseconds: 50),
//     curve: Curves.easeIn,
//   );
// }
