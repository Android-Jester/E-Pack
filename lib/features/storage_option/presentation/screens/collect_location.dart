import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/check_box_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/provider/collection_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectLocation extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;

  CollectLocation({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<CollectLocation> createState() => _CollectLocationState();
}

class _CollectLocationState extends State<CollectLocation> {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<CollectionInfo>(
      builder: (context, data, child) {
        return SingleChildScrollView(
          child: Container(
            width: Config.width,
            child: Form(
              key: data.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: itemHeight(5.0),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(10.0)),
                    child: Column(
                      children: [
                        textWithLabel(
                          text: "Residence Name",
                          controller: data.residenceNameController,
                          type: TextInputType.name,
                          validate: (String? val) => data.validator(val!),
                        ),
                        textWithLabel(
                          text: "Room or flat number",
                          controller: data.roomNumController,
                          type: TextInputType.number,
                          validate: (String? val) =>
                              data.validator(val!, isNumeric: true),
                        ),
                        textWithLabel(
                            text: "Mobile",
                            controller: data.mobileNumController,
                            validate: (String? val) => data.validator(val!,
                                isNumeric: true, isPhoneNumber: true),
                            type: TextInputType.phone),
                        const Divider(),
                        textWithLabel(
                          text: "Address Type",
                          controller: data.addressTypeController,
                          validate: (String? val) => data.validator(val!),
                        ),
                        textWithLabel(
                          text: "Access Note",
                          validate: (String? val) => data.validator(val!),
                          controller: data.accessNoteController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: itemHeight(20.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
                    child: const Text(
                      "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(height: itemHeight(20.0)),
                  checkboxRow(
                    text: "Granting Access",
                    boolean: data.isGranted,
                    function: (val) => data.setGranted(val!),
                  ),
                  checkboxRow(
                      text: "I agree to terms and conditions",
                      boolean: data.isAgreed,
                      function: (val) => data.setAgree(val!)),
                  SizedBox(height: itemHeight(15.0)),
                  buttonRow(widget.controller!, widget.currentPage!,
                      nextButton: () => (data.isGranted && data.isAgreed)
                          ? direction(
                              widget.controller!, widget.currentPage!, true)
                          : null)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
