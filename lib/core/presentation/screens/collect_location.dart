import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/check_box_row.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/pages/storage_option/components/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectLocation extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();
  final Body body;

  CollectLocation({required this.body});
  TextEditingController residenceNameController = TextEditingController();
  TextEditingController roomNumController = TextEditingController();
  TextEditingController mobileNumController = TextEditingController();
  TextEditingController addressTypeController = TextEditingController();
  TextEditingController accessNoteController = TextEditingController();

  validations() {
    if (_formKey.currentState!.validate()) {
      body.setResidenceName(residenceNameController.text);
      body.setRoomNumber(int.parse(roomNumController.text));
      body.setPhoneNumber(mobileNumController.text);
      body.setAddressType(addressTypeController.text);
      body.setAccessNote(accessNoteController.text);
    }
  }

  @override
  State<CollectLocation> createState() => _CollectLocationState();
}

class _CollectLocationState extends State<CollectLocation> {
  bool isGranted = false;

  bool agreed = false;

  @override
  void dispose() {
    super.dispose();
    widget.residenceNameController.dispose();
    widget.roomNumController.dispose();
    widget.mobileNumController.dispose();
    widget.addressTypeController.dispose();
    widget.accessNoteController.dispose();
  }

  validatingChecker(String val, String indicator) {
    if (val.isEmpty) {
      return "Please enter the right $indicator";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SingleChildScrollView(
      child: Form(
        key: widget._formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: itemHeight(5.0),
            ),
            textWithLabel(
                onChanged: (val) => validatingChecker(val!, "name"),
                text: "Residence Name",
                controller: widget.residenceNameController,
                type: TextInputType.name),
            textWithLabel(
                onChanged: (val) => validatingChecker(val!, "room number"),
                text: "Room or flat number",
                controller: widget.roomNumController,
                type: TextInputType.number),
            textWithLabel(
                onChanged: (val) => validatingChecker(val!, "phone number"),
                text: "Mobile",
                controller: widget.mobileNumController,
                type: TextInputType.phone),
            const Divider(),
            textWithLabel(
                onChanged: (val) => validatingChecker(val!, "address"),
                text: "Address Type",
                controller: widget.addressTypeController),
            textWithLabel(
                onChanged: (val) => validatingChecker(val!, "Note"),
                text: "Access Note",
                controller: widget.accessNoteController),
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
