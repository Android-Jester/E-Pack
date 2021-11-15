import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/delivery_recepient_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
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
  List<Widget> choices = [
    Consumer<DeliveryRecepientInfo>(
      builder: (context, data, widget) {
        return Container(
          width: Config.width,
          height: Config.height! / 2,
          child: Form(
            key: data.key,
            child: Column(
              children: [
                textWithLabel(
                    validate: (val) => data.validator(val!),
                    text: "Destination Address",
                    controller: data.destinationAddressController),
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
              ],
            ),
          ),
        );
      },
    ),
    SingleChildScrollView(
      child: Consumer<DeliveryRecepientInfo>(
        builder: (context, data, widget) {
          return Container(
            width: Config.width,
            height: Config.height! / 2,
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  textWithLabel(
                      validate: (val) => data.validator(val!),
                      text: "Destination Address",
                      controller: data.destinationAddressController),
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
                ],
              ),
            ),
          );
        },
      ),
    ),
    SingleChildScrollView(
      child: Consumer<DeliveryRecepientInfo>(
        builder: (context, data, widget) {
          return Container(
            width: Config.width,
            height: Config.height! / 2,
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
                ],
              ),
            ),
          );
        },
      ),
    ),
    SingleChildScrollView(
      child: Consumer<DeliveryRecepientInfo>(
        builder: (context, data, widget) {
          return Container(
            width: Config.width,
            height: Config.height! / 2,
            child: Form(
              key: data.key,
              child: Column(
                children: [
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
                ],
              ),
            ),
          );
        },
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return SingleChildScrollView(
      child: Container(
        height: Config.height,
        width: Config.width,
        child: Column(
          children: [
            choices[Provider.of<RelocationDetailsInfo>(context, listen: false)
                    .relocationValue -
                1],
            CustomButton(
                text: "Book Now",
                onPressed: () {
                  Provider.of<DeliveryRecepientInfo>(context, listen: false)
                      .validation(context);
                }),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
