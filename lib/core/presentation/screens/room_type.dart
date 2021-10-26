import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/features/storage_option/presentation/pages/storage_option/components/body.dart';
import 'package:flutter/material.dart';

class RoomType extends StatefulWidget {
  final Body body;
  const RoomType({Key? key, required this.body}) : super(key: key);

  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> {
  int selectedRadio = 0;

  Widget selectionRow({required String? text, required int? value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text!),
        Radio<int>(
          value: value!,
          groupValue: selectedRadio,
          onChanged: (valued) => setState(() {
            print(valued);
            selectedRadio = valued!;
            widget.body.setCollectRoomType(valued.toString());
          }),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Container(
      width: Config.width,
      height: Config.height,
      child: Column(
        children: [
          Text("Select One Option"),
          Text("Select Room Type"),
          Divider(),
          selectionRow(
            value: 1,
            text: "Single Room",
          ),
          selectionRow(
            value: 2,
            text: "Double Room",
          ),
          selectionRow(
            value: 3,
            text: "Two or more",
          ),
          selectionRow(
            value: 4,
            text: "Apartment",
          ),
          selectionRow(
            value: 5,
            text: "Homestel",
          ),
          Spacer(),
        ],
      ),
    );
  }
}
