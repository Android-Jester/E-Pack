import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/box_selection.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_period_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoragePeriod extends StatelessWidget {
  final TextEditingController? weeksStoredBoxController =
      TextEditingController(text: "0");
  final PageController? controller;
  final int? currentPage;
  StoragePeriod({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

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
                    "Total: ${data.setCost(context)}",
                  ),
                ),
              ),
              Spacer(),
              PageButton(
                isForward: false,
                pageCount: currentPage!,
                controller: controller!,
              ),
              PageButton(
                isForward: true,
                pageCount: currentPage!,
                controller: controller!,
                isDisabled: (data.weeksStored == 0),
              ),
            ],
          )),
    );
  }
}
