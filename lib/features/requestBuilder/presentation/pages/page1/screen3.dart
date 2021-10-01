import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/box_selection.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  final TextEditingController? largeBoxController;
  final TextEditingController? mediumBoxController;
  final TextEditingController? smallBoxController;
  const Screen3(
      {Key? key,
      required this.largeBoxController,
      required this.mediumBoxController,
      required this.smallBoxController})
      : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
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
              textEditingController: widget.largeBoxController,
              text: "Large Box"),
          BoxSelection(
              textEditingController: widget.mediumBoxController,
              text: "Medium Box"),
          BoxSelection(
              textEditingController: widget.smallBoxController,
              text: "Small Box"),
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
