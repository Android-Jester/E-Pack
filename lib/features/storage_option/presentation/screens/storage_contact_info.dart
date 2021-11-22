import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_recepient_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StorageContactInfo extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;

  StorageContactInfo({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<StorageContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<StorageContactInfo> {
  late FocusNode node;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    node = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    node.dispose();
  }

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
                  TextWithLabel(
                    text: "Current Location",
                    textCon: data.locationAddressController,
                    validate: (val) => data.validator(val!),
                  ),
                  TextWithLabel(
                      validate: (val) => data.validator(val!,
                          isPhoneNumber: true, isNumeric: true),
                      text: "Local Phone Number",
                      textCon: data.phoneNumberController,
                      type: TextInputType.phone),
                  TextWithLabel(
                      validate: (val) => data.validator(val!,
                          isPhoneNumber: true, isNumeric: true),
                      text: "WhatsApp Number",
                      textCon: data.whatsAppNumberController,
                      type: TextInputType.phone),
                  TextWithLabel(
                      text: "Contact Times per week",
                      textCon: data.contactTimesController,
                      validate: (val) => data.validator(val!,
                          isPhoneNumber: true, isNumeric: true),
                      type: TextInputType.number),
                  TextWithLabel(
                      text: "Notes",
                      textCon: data.notesController,
                      validate: (val) => data.validator(val!),
                      type: TextInputType.multiline),
                  Spacer(),
                  CustomButton(
                    onPressed: () async => data.validation(
                        context, widget.controller!, widget.currentPage!),
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
