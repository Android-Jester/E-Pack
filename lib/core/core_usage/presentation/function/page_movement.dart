import 'package:flutter/material.dart';

import '../widgets/page_directions.dart';

void direction(PageController page, ScrollController scroll, int pageCount, [bool isForward = false]) {
  if (scroll.hasClients) {
    scroll.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }
  page.animateToPage(
    (isForward) ? pageCount + 1 : pageCount - 1,
    duration: const Duration(milliseconds: 50),
    curve: Curves.easeIn,
  );
}

// buttonRow(PageController controller, int currentPage, {required void Function() nextButton}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceAround,
//     children: [
//       PageButton(
//         false,
//         onPressed: () => direction(controller, currentPage, false),
//       ),
//       PageButton(
//         true,
//         onPressed: nextButton,
//       ),
//     ],
//   );
// }

class ButtonRow extends StatelessWidget {
  final PageController pageController;
  final ScrollController scroll;
  final int currentPage;
  final void Function() nextAction;




  const ButtonRow({
    required this.pageController,
    required this.currentPage,
    required this.scroll,
    required this.nextAction,
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        PageButton(
          false,
          onPressed: () => direction(pageController, scroll, currentPage, false),
        ),
        PageButton(
          true,
          onPressed: nextAction,
        ),
      ],
    );
  }
}
