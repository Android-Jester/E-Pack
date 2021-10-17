//TODO: collection of location info

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../widgets/check_box_row.dart';
import '../../widgets/text_with_label.dart';

class Screen5 extends StatefulWidget {
  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  bool isGranted = false;

  bool agreed = false;

  TextEditingController residenceNameController = TextEditingController();
  TextEditingController roomNumController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController addressTypeController = TextEditingController();
  TextEditingController accessNoteController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    residenceNameController.dispose();
    roomNumController.dispose();
    mobileNumController.dispose();
    addressTypeController.dispose();
    accessNoteController.dispose();
  }

  validatingChecker(String val, String indicator) {
    if (val.isEmpty) {
      return "Please enter the right $indicator";
    }
    return null;
  }

  validations() {
    if (_formKey.currentState!.validate()) {}
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: itemHeight(5.0),
            ),
            textWithLabel(
                onChanged: (val) {
                  validatingChecker(residenceNameController.text, "name");
                },
                text: "Residence Name",
                controller: residenceNameController,
                type: TextInputType.name),
            textWithLabel(
                onChanged: (val) {
                  validatingChecker(
                      residenceNameController.text, "room number");
                },
                text: "Room or flat number",
                controller: roomNumController,
                type: TextInputType.number),
            textWithLabel(
                onChanged: (val) {
                  validatingChecker(
                      residenceNameController.text, "phone number");
                },
                text: "Mobile",
                controller: mobileNumController,
                type: TextInputType.phone),
            const Divider(),
            textWithLabel(
                onChanged: (val) {
                  validatingChecker(residenceNameController.text, "address");
                },
                text: "Address Type",
                controller: addressTypeController),
            textWithLabel(
                onChanged: (val) {},
                text: "Access Note",
                controller: accessNoteController),
            const Text(
                "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items"),
            checkboxRow(text: "Granting Access", boolean: isGranted),
            checkboxRow(
                text: "I agree to terms and conditions", boolean: agreed)
          ],
        ),
      ),
    );
  }
}
