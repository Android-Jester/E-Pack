import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/box_selection.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/box_size_data.dart';
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

class _BoxChoicesState extends State<BoxChoices>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<BoxSizeData>(builder: (context, data, child) {
      return Container(
        width: Config.width,
        height: Config.height,
        child: Column(
          children: [
            const Divider(),
            const Text("Select"),
            SizedBox(
              height: itemHeight(45.0),
            ),
            const Text(
                "Please choose the particular type and number of boxes you may need for your belongings"),
            const Divider(),
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
            SizedBox(
              height: itemHeight(45.0),
            ),
            Container(
              color: Colors.red.shade200,
              width: Config.width,
              height: Config.width! / 3,
              child: const Text(
                  "NB:  Size of Large Box: 18”x18”x24” \n Size of Medium Box: 18”x18”x16” \n Size of Small Box: 16”x12”x12” "),
            ),
            SizedBox(
              height: itemHeight(45.0),
            ),
            PageButton(
              isForward: false,
              pageCount: widget.currentPage!,
              controller: widget.controller!,
            ),
            PageButton(
                isForward: true,
                pageCount: widget.currentPage!,
                controller: widget.controller!,
                isDisabled: (data.largeBoxSizeText == 0 &&
                        data.mediumBoxSizeText == 0 &&
                        data.smallBoxSizeText == 0)
                    ? true
                    : false),
          ],
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
