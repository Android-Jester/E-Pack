import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_recepient_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ContactInfo extends StatelessWidget {
  final PageController? controller;
  final int? currentPage;

  ContactInfo({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<StorageRecepientInfo>(
      builder: (context, data, child) => SingleChildScrollView(
        child: Container(
          height: Config.height! / 1.5,
          width: Config.width,
          child: Padding(
            padding: EdgeInsets.only(left: itemWidth(8.0)),
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  textWithLabel(
                    text: "Current Location",
                    controller: data.locationAddressController,
                    validate: (val) => data.validator(val!),
                  ),
                  textWithLabel(
                      validate: (val) => data.validator(val!,
                          isPhoneNumber: true, isNumeric: true),
                      text: "Local Phone Number",
                      controller: data.phoneNumberController,
                      type: TextInputType.phone),
                  textWithLabel(
                      validate: (val) => data.validator(val!,
                          isPhoneNumber: true, isNumeric: true),
                      text: "WhatsApp Number",
                      controller: data.whatsAppNumberController,
                      type: TextInputType.phone),
                  textWithLabel(
                      text: "Contact Times per week",
                      controller: data.contactTimesController,
                      validate: (val) => data.validator(val!,
                          isPhoneNumber: true, isNumeric: true),
                      type: TextInputType.number),
                  textWithLabel(
                      text: "Notes",
                      controller: data.notesController,
                      validate: (val) => data.validator(val!,
                          isPhoneNumber: true, isNumeric: true),
                      type: TextInputType.multiline),
                  Spacer(),
                  CustomButton(
                    onPressed: () async => data.validation(context),
                    text: 'Book Now',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
