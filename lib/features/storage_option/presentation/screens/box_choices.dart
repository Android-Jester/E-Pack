import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/box_selection.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/storage_option/presentation/provider/box_size_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BoxChoices extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;
  BoxChoices({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _BoxChoicesState createState() => _BoxChoicesState();
}

class _BoxChoicesState extends State<BoxChoices> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BoxSizeData>(
      builder: (context, data, child) => Container(
        width: Config.width,
        height: Config.height,
        child: Column(
          children: [
            const Divider(),
            const Text("Select"),
            const Text(
                "Please choose the particular type and number of boxes you may need for your belongings"),
            const Divider(),
            const Spacer(),
            BoxSelection(
              textEditingController: data.largeBoxController,
              text: "Large Box",
            ),
            BoxSelection(
              textEditingController: data.mediumBoxController,
              text: "Medium Box",
            ),
            BoxSelection(
              textEditingController: data.smallBoxController,
              text: "Small Box",
            ),
            const Spacer(),
            Container(
              color: Colors.red.shade200,
              width: Config.width,
              height: Config.width! / 3,
              child: const Text(
                  "NB:  Size of Large Box: 18”x18”x24” \n Size of Medium Box: 18”x18”x16” \n Size of Small Box: 16”x12”x12” "),
            ),
            const Spacer(),
            PageButton(
              isForward: false,
              pageCount: widget.currentPage!,
              controller: widget.controller!,
            ),
            PageButton(
              isForward: true,
              pageCount: widget.currentPage!,
              controller: widget.controller!,
              isDisabled: (data.largeBoxSizeText == null &&
                      data.mediumBoxSizeText == null &&
                      data.smallBoxSizeText == null) ||
                  (data.largeBoxSizeText == 0 ||
                      data.mediumBoxSizeText == 0 ||
                      data.smallBoxSizeText == 0),
            ),
          ],
        ),
      ),
    );
  }
}
