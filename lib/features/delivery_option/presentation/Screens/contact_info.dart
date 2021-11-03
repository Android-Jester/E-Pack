import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/delivery_recepient_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInfo extends StatefulWidget {
  final PageController? controller;
  final int currentPage;

  ContactInfo({
    required this.controller,
    required this.currentPage,
  });

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);

    return Consumer<DeliveryRecepientInfo>(
      builder: (context, data, widget) {
        return SingleChildScrollView(
          child: Container(
            width: Config.width,
            height: Config.height,
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Destination Address",
                      controller: data.destinationAddressController),
                  textWithLabel(
                      validate: (val) => data.validator(val!, isNumeric: true),
                      text: "Room Number",
                      controller: data.roomNumberController,
                      type: TextInputType.phone),
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Contact Name",
                      controller: data.contactNameController,
                      type: TextInputType.phone),
                  textWithLabel(
                      validate: (val) => data.validator(val!,
                          isNumeric: true, isPhoneNumber: true),
                      text: "Contact Phone Number",
                      controller: data.contactNumberController,
                      type: TextInputType.number),
                  CustomButton(
                    onPressed: () async {
                      await data.validation(context);
                    },
                    text: 'Book Now',
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
