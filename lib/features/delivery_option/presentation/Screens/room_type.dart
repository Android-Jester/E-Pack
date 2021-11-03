import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/room_type_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomType extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;
  RoomType({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType>
    with AutomaticKeepAliveClientMixin {
  int selectedRadio = 0;

  Widget selectionRow(
      {required String? text,
      required int? value,
      required int groupValue,
      required RoomTypeData data}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text!),
        Radio<int>(
          value: value!,
          groupValue: groupValue,
          onChanged: (valued) => data.setRoomType(valued!),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<RoomTypeData>(builder: (context, data, _) {
      return Container(
        width: Config.width,
        height: Config.height,
        child: Column(
          children: [
            Text("Select One Option"),
            Text("Select Room Type"),
            Divider(),
            selectionRow(
              data: data,
              value: 1,
              text: "Single Room",
              groupValue: data.roomType,
            ),
            selectionRow(
              data: data,
              value: 2,
              text: "Double Room",
              groupValue: data.roomType,
            ),
            selectionRow(
              data: data,
              value: 3,
              text: "Two or more",
              groupValue: data.roomType,
            ),
            selectionRow(
              data: data,
              value: 4,
              text: "Apartment",
              groupValue: data.roomType,
            ),
            selectionRow(
              data: data,
              value: 5,
              text: "Homestel",
              groupValue: data.roomType,
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
              isDisabled: (data.roomType == 0) ? true : false,
            ),
          ],
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
