//TODO: collection of location info

import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/check_box_row.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/text_with_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen5 extends StatelessWidget {
  bool isGranted = false;
  bool agreed = false;
  TextEditingController? residenceNameController;
  TextEditingController? roomNumController;
  TextEditingController? mobileNumController;
  TextEditingController? addressTypeController;
  TextEditingController? accessNoteController;

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: itemHeight(5.0),
          ),
          textWithLabel(
              text: "Residence Name", controller: residenceNameController),
          textWithLabel(
              text: "Room or flat number", controller: roomNumController),
          textWithLabel(text: "Mobile", controller: mobileNumController),
          const Divider(),
          textWithLabel(
              text: "Address Type", controller: addressTypeController),
          textWithLabel(text: "Access Note", controller: accessNoteController),
          const Text(
              "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items"),
          checkboxRow(text: "Granting Access", boolean: isGranted),
          checkboxRow(text: "I agree to terms and conditions", boolean: agreed)
        ],
      ),
    );
  }
}
