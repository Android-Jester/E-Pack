import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
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
    return Consumer<RoomTypeData>(
      builder: (context, data, child) {
        return Container(
          width: Config.width,
          height: Config.height,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemHeight(15)),
                child: Divider(
                  color: Colors.black,
                  thickness: itemHeight(0.5),
                  height: itemHeight(1.5),
                ),
              ),
              Text(
                "Select One Option",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                "Select Room Type",
                style: Theme.of(context).textTheme.headline3,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemHeight(25)),
                child: Divider(
                  color: Colors.black,
                  thickness: itemHeight(0.5),
                  height: itemHeight(1.5),
                ),
              ),
              SizedBox(height: itemHeight(15.0)),
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
              SizedBox(height: itemHeight(25.0)),
              buttonRow(widget.controller!, widget.currentPage!,
                  nextButton: () => (data.roomType == 0)
                      ? null
                      : direction(
                          widget.controller!, widget.currentPage!, true))
            ],
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
