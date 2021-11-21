import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/box_selection.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_period_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoragePeriod extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;
  StoragePeriod({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<StoragePeriod> createState() => _StoragePeriodState();
}

class _StoragePeriodState extends State<StoragePeriod>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<StoragePeriodInfo>(
        builder: (context, data, child) => Container(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
                  child: const Text(
                    "Please Confirm how long you would want your belongings to be stored. You can always extend the length of storage if you require to store for longer period at anytime. By calling our emergency line, you can request your items to be returned without refund after it has been stored for a period.",
                  ),
                ),
                SizedBox(
                  height: itemHeight(10.0),
                ),
                BoxSelection(
                    textEditingController: data.weeksStoredBoxController,
                    text: "No of Weeks Stored: \$"),
                SizedBox(height: itemHeight(50.0)),
                SizedBox(height: itemHeight(15.0)),
                buttonRow(widget.controller!, widget.currentPage!,
                    nextButton: () => (data.weeksStored == 0)
                        ? null
                        : direction(
                            widget.controller!, widget.currentPage!, true))
              ],
            )));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
