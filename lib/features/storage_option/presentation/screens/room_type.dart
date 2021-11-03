import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/core/presentation/widgets/selection_radio.dart';
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

class _RoomTypeState extends State<RoomType> {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<RoomTypeData>(
      builder: (context, data, child) {
        return Container(
          width: Config.width,
          height: Config.height,
          child: Column(
            children: [
              Text("Select One Option"),
              Text("Select Room Type"),
              Divider(),
              SelectionRadio(
                value: 1,
                text: "Single Room",
                groupValue: data.roomType,
                changed: (val) => data.setRoomType(val!),
              ),
              SelectionRadio(
                value: 2,
                text: "Double Room",
                groupValue: data.roomType,
                changed: (val) => data.setRoomType(val!),
              ),
              SelectionRadio(
                value: 3,
                text: "Two or more",
                groupValue: data.roomType,
                changed: (val) => data.setRoomType(val!),
              ),
              SelectionRadio(
                value: 4,
                text: "Apartment",
                groupValue: data.roomType,
                changed: (val) => data.setRoomType(val!),
              ),
              SelectionRadio(
                value: 5,
                text: "Homestel",
                groupValue: data.roomType,
                changed: (val) => data.setRoomType(val!),
              ),
              Spacer(),
              PageButton(
                isForward: false,
                pageCount: widget.currentPage!,
                controller: widget.controller!,
              ),
              PageButton(
                isForward: true,
                pageCount: widget.currentPage!,
                controller: widget.controller!,
                isDisabled: data.roomType == 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
