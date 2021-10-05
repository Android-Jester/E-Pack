import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/box_selection.dart';
import 'package:flutter/material.dart';

class Screen4 extends StatelessWidget {
  final TextEditingController? weeksStoredBoxController =
      TextEditingController(text: "0");
  Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    // TODO: implement build
    return Container(
        width: 100,
        height: 100,
        child: Column(
          children: [
            const Text(
              "Select Option",
              textAlign: TextAlign.center,
            ),
            Divider(
              thickness: itemHeight(0.5),
              color: const Color(0xFF020202),
            ),
            SizedBox(
              height: itemHeight(5.0),
            ),
            const Text(
              "Please Confirm how long you would want your belongings to be stored. You can always extend the length of storage if you require to store for longer period at anytime. By calling our emergency line, you can request your items to be returned without refund after it has been stored for a period.",
            ),
            SizedBox(
              height: itemHeight(10.0),
            ),
            BoxSelection(
                textEditingController: weeksStoredBoxController,
                text: "Number of weeks stored: \$"),
            const Spacer(),
            Padding(
              padding: EdgeInsets.all(itemWidth(20.0)),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Total: ${int.parse(weeksStoredBoxController!.text) * 5}",
                ),
              ),
            ),
          ],
        ));
  }
}
