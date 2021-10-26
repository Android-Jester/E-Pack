import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/box_selection.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/components/body.dart';
import 'package:flutter/material.dart';

class BoxChoices extends StatefulWidget {
  final Body body;
  BoxChoices({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  _BoxChoicesState createState() => _BoxChoicesState();
}

class _BoxChoicesState extends State<BoxChoices> {
  TextEditingController? largeBoxController = TextEditingController(text: "0");
  TextEditingController? mediumBoxController = TextEditingController(text: "0");
  TextEditingController? smallBoxController = TextEditingController(text: "0");
  @override
  Widget build(BuildContext context) {
    return Container(
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
              textEditingController: largeBoxController, text: "Large Box"),
          BoxSelection(
              textEditingController: mediumBoxController, text: "Medium Box"),
          BoxSelection(
              textEditingController: smallBoxController, text: "Small Box"),
          const Spacer(),
          Container(
            color: Colors.red.shade200,
            width: Config.width,
            height: Config.width! / 3,
            child: const Text(
                "NB:  Size of Large Box: 18”x18”x24” \n Size of Medium Box: 18”x18”x16” \n Size of Small Box: 16”x12”x12” "),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
