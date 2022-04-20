import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/function/scroll_movement.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/dialog_states.dart';
import '../../../../core/core_usage/presentation/widgets/options/selection_radio.dart';
import '../provider/bloc/delivery_cubit.dart';

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
    var data = BlocProvider.of<DeliveryCubit>(context);
    Config.init(context);
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
            ButtonRow(
              pageController: widget.controller!,
              currentPage: widget.currentPage!,
              scroll: widget.scroll,
              nextAction: () {
                if (data.roomType == 0) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return WarningDialog(
                          text: 'Room Type Not Selected',
                        );
                      });
                } else {
                  direction(widget.controller!, widget.scroll, widget.currentPage!, true);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Column radioColumn(DeliveryCubit data) => Column(
        children: [
          SelectionRadio(
            value: 1,
            text: "Single Room",
            groupValue: data.roomType,
            changed: (val) => data.roomType = val!,
          ),
          SelectionRadio(
            value: 2,
            text: "Double Room",
            groupValue: data.roomType,
            changed: (val) => data.roomType = val!,
          ),
          SelectionRadio(
            value: 3,
            text: "Two or more",
            groupValue: data.roomType,
            changed: (val) => data.roomType = val!,
          ),
          SelectionRadio(
            value: 4,
            text: "Apartment",
            groupValue: data.roomType,
            changed: (val) => data.roomType = val!,
          ),
          SelectionRadio(
            value: 5,
            text: "Homestel",
            groupValue: data.roomType,
            changed: (val) => data.roomType = val!,
          ),
        ],
      );

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
