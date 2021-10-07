import 'package:e_pack/features/requestBuilder/presentation/widgets/text_with_label.dart';
import 'package:flutter/cupertino.dart';

class Screen6 extends StatelessWidget {
  TextEditingController? locationTextcontroller;
  TextEditingController? phoneNumcontroller;
  TextEditingController? whatsappNumcontroller;
  TextEditingController? contactTimescontroller;
  TextEditingController? notescontroller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          textWithLabel(
              text: "Current Location", controller: locationTextcontroller),
          textWithLabel(
              text: "Local Phone Number",
              controller: phoneNumcontroller,
              type: TextInputType.phone),
          textWithLabel(
              text: "WhatsApp Number",
              controller: whatsappNumcontroller,
              type: TextInputType.phone),
          textWithLabel(
              text: "Contact Times per week",
              controller: contactTimescontroller,
              type: TextInputType.number),
          textWithLabel(
              text: "Notes",
              controller: notescontroller,
              type: TextInputType.multiline),
        ],
      ),
    );
  }
}
