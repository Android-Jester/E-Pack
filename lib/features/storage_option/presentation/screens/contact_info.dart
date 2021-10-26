import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/pages/storage_option/components/body.dart';
import 'package:flutter/cupertino.dart';

class ContactInfo extends StatelessWidget {
  final Body body;

  ContactInfo({Key? key, required this.body}) : super(key: key);
  TextEditingController? locationTextcontroller;
  TextEditingController? phoneNumcontroller;
  TextEditingController? whatsappNumcontroller;
  TextEditingController? contactTimescontroller;
  TextEditingController? notescontroller;

  final _formKey = GlobalKey<FormState>();

  validatingChecker(String val, String indicator) {
    if (val.isEmpty) {
      return "Please enter the right $indicator";
    }
    return null;
  }

  validations() {
    if (_formKey.currentState!.validate()) {
      Body().setLocationName(locationTextcontroller!.text);
      Body().setLocalPhoneNum(phoneNumcontroller!.text);
      Body().setWhatsPhoneNum(whatsappNumcontroller!.text);
      Body().setContactTimes(int.parse(contactTimescontroller!.text));
      Body().setAccessNote(notescontroller!.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          textWithLabel(
              onChanged: (val) => validatingChecker(val!, "Location Name"),
              text: "Current Location",
              controller: locationTextcontroller),
          textWithLabel(
              onChanged: (val) => validatingChecker(val!, "Phone Number"),
              text: "Local Phone Number",
              controller: phoneNumcontroller,
              type: TextInputType.phone),
          textWithLabel(
              onChanged: (val) => validatingChecker(val!, "WhatsApp Number"),
              text: "WhatsApp Number",
              controller: whatsappNumcontroller,
              type: TextInputType.phone),
          textWithLabel(
              onChanged: (val) => validatingChecker(val!, "number"),
              text: "Contact Times per week",
              controller: contactTimescontroller,
              type: TextInputType.number),
          textWithLabel(
              onChanged: (val) => validatingChecker(val!, "note"),
              text: "Notes",
              controller: notescontroller,
              type: TextInputType.multiline),
        ],
      ),
    ));
  }
}
