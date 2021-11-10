//TODO: collection of location info

import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/check_box_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/collection_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryInfo extends StatefulWidget {
  final PageController? controller;
  final int currentPage;

  List<Widget> choice = [];

  DeliveryInfo({
    required this.controller,
    required this.currentPage,
  });
  @override
  State<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<CollectionInfo>(
      builder: (context, data, _) {
        return SingleChildScrollView(
          child: Container(
            width: Config.width,
            height: Config.height,
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  SizedBox(
                    height: itemHeight(5.0),
                  ),
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Residence Name",
                      controller: data.residenceNameController,
                      type: TextInputType.name),
                  textWithLabel(
                      validate: (val) => data.validator(val!, isNumeric: true),
                      text: "Room or flat number",
                      controller: data.roomNumController,
                      type: TextInputType.number),
                  textWithLabel(
                      validate: (val) => data.validator(val!,
                          isNumeric: true, isPhoneNumber: true),
                      text: "Mobile",
                      controller: data.mobileNumController,
                      type: TextInputType.phone),
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Address Type",
                      controller: data.addressTypeController),
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Access Note",
                      controller: data.accessNoteController),
                  SizedBox(height: itemHeight(10.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
                    child: const Text(
                        "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items"),
                  ),
                  checkboxRow(
                      text: "Granting Access",
                      boolean: data.isGranted,
                      function: (val) => data.setGranted(val!)),
                  checkboxRow(
                      text: "I agree to terms and conditions",
                      boolean: data.isAgreed,
                      function: (val) => data.setAgree(val!)),
                  buttonRow(widget.controller!, widget.currentPage,
                      nextButton: () => (data.isGranted && data.isAgreed)
                          ? direction(
                              widget.controller!, widget.currentPage, true)
                          : () {
                              print("disabled");
                            })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
