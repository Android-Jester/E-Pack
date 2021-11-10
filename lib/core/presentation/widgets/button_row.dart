import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:flutter/material.dart';

buttonRow(PageController controller, int currentPage,
    {required void Function() nextButton}) {
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
