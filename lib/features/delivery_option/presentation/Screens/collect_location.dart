//TODO: collection of location info

import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/check_box_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/collection_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryInfo extends StatefulWidget {
  final PageController? controller;
  final int currentPage;

  DeliveryInfo({
    required this.controller,
    required this.currentPage,
  });
  @override
  State<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo>
    with AutomaticKeepAliveClientMixin {
  options() {
    if (Provider.of<RelocationDetailsInfo>(context).relocationValue == 1) {}
  }

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
                  const Divider(),
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Address Type",
                      controller: data.addressTypeController),
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Access Note",
                      controller: data.accessNoteController),
                  const Text(
                      "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items"),
                  checkboxRow(
                      text: "Granting Access",
                      boolean: data.isGranted,
                      function: (val) => data.setGranted(val!)),
                  checkboxRow(
                      text: "I agree to terms and conditions",
                      boolean: data.isGranted,
                      function: (val) => data.setAgree(val!)),
                  PageButton(
                    isForward: false,
                    pageCount: widget.currentPage,
                    controller: widget.controller,
                  ),
                  PageButton(
                    isForward: true,
                    pageCount: widget.currentPage,
                    controller: widget.controller,
                    isDisabled: (!data.validated) ? true : false,
                    function: () => data.nextButton(),
                  ),
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
