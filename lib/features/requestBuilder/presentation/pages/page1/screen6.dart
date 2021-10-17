import 'package:e_pack/features/requestBuilder/presentation/widgets/text_with_label.dart';
import 'package:flutter/cupertino.dart';

class Screen6 extends StatelessWidget {
  TextEditingController? locationTextcontroller;
  TextEditingController? phoneNumcontroller;
  TextEditingController? whatsappNumcontroller;
  TextEditingController? contactTimescontroller;
  TextEditingController? notescontroller;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          textWithLabel(
              onChanged: (val) {},
              text: "Current Location",
              controller: locationTextcontroller),
          textWithLabel(
              onChanged: (val) {},
              text: "Local Phone Number",
              controller: phoneNumcontroller,
              type: TextInputType.phone),
          textWithLabel(
              onChanged: (val) {},
              text: "WhatsApp Number",
              controller: whatsappNumcontroller,
              type: TextInputType.phone),
          textWithLabel(
              onChanged: (val) {},
              text: "Contact Times per week",
              controller: contactTimescontroller,
              type: TextInputType.number),
          textWithLabel(
              onChanged: (val) {},
              text: "Notes",
              controller: notescontroller,
              type: TextInputType.multiline),
        ],
      ),
    ));
  }
}
