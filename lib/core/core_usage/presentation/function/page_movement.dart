import 'package:flutter/material.dart';

import '../widgets/page_directions.dart';

void direction(PageController controller, int pageCount, [bool isForward = false]) {
  controller.animateToPage(
    (isForward) ? pageCount + 1 : pageCount - 1,
    duration: const Duration(milliseconds: 50),
    curve: Curves.easeIn,
  );
}

buttonRow(PageController controller, int currentPage, {required void Function() nextButton}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      PageButton(
        false,
        onPressed: () => direction(controller, currentPage, false),
      ),
      PageButton(
        true,
        onPressed: nextButton,
      ),
    ],
  );
}