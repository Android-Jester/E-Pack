import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/page_button.dart';
import 'package:e_pack/core/presentation/widgets/selection_radio.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/delivery_option/presentation/components/body.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/room_type_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RoomType extends StatefulWidget {
  final PageController? controller;
  final ScrollController scroll;
  final int? currentPage;
  RoomType({
    Key? key,
    required this.scroll,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<RoomType> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<RoomTypeData>(
      builder: (context, data, child) {
        return SingleChildScrollView(
          child: ContainerWrapper(
            padding: EdgeInsets.symmetric(vertical: itemHeight(30.0)),
            width: Config.width,
            child: Column(
              children: [
                Text(
                  "Select Room Type",
                  style: Theme.of(context).textTheme.headline3,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: itemHeight(15)),
                  child: Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    thickness: itemHeight(1),
                    height: itemHeight(1.5),
                  ),
                ),
                SizedBox(height: itemHeight(15.0)),
                radioColumn(data),
                SizedBox(height: itemHeight(25.0)),
                buttonRow(widget.controller!, widget.currentPage!, nextButton: () {
                  if (data.roomType == 0) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return WarningDialog(
                            text: 'Room Type Not Selected',
                          );
                        });
                  } else {
                    smoothScrollToTop(widget.scroll);
                    direction(widget.controller!, widget.currentPage!, true);
                  }
                })
              ],
            ),
          ),
        );
      },
    );
  }

  Column radioColumn(RoomTypeData data) => Column(
        children: [
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
        ],
      );

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
