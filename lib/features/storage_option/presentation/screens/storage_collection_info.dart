import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/check_box_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/provider/collection_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StorageCollectionInfo extends StatefulWidget {
  final PageController? controller;
  final int? currentPage;

  StorageCollectionInfo({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<StorageCollectionInfo> createState() => _CollectLocationState();
}

class _CollectLocationState extends State<StorageCollectionInfo> {
  late FocusNode residenceNode;
  late FocusNode phoneNode;
  late FocusNode roomNode;
  late FocusNode accessNotesNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    residenceNode = FocusNode();
    phoneNode = FocusNode();
    roomNode = FocusNode();
    accessNotesNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    residenceNode.dispose();
    phoneNode.dispose();
    roomNode.dispose();
    accessNotesNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<StorageCollectionData>(
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
                        TextWithLabel(
                          text: "Residence Name",
                          textCon: data.residenceNameController,
                          type: TextInputType.name,
                          validate: (String? val) => data.validator(val!),
                          node: residenceNode,
                          nextNode: roomNode,
                        ),
                        TextWithLabel(
                          text: "Room or flat number",
                          textCon: data.roomNumController,
                          type: TextInputType.number,
                          validate: (String? val) =>
                              data.validator(val!, isNumeric: true),
                          node: roomNode,
                          nextNode: phoneNode,
                        ),
                        TextWithLabel(
                          text: "Mobile",
                          textCon: data.mobileNumController,
                          validate: (String? val) => data.validator(val!,
                              isNumeric: true, isPhoneNumber: true),
                          type: TextInputType.phone,
                          node: phoneNode,
                          nextNode: accessNotesNode,
                        ),
                        const Divider(),
                        Container(
                          padding: EdgeInsets.only(top: itemHeight(10.0)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address Type",
                                style: TextStyle(fontSize: itemWidth(15.0)),
                              ),
                              SizedBox(
                                height: itemHeight(2.5),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: itemWidth(30.0)),
                                child: DropdownButtonFormField(
                                  decoration: inputDecoration,
                                  value: data.addressType,
                                  items: const [
                                    DropdownMenuItem(
                                      child: Text("Hostel"),
                                      value: "Hostel",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Homestel"),
                                      value: "Homestel",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Flat"),
                                      value: "Flat",
                                    ),
                                    DropdownMenuItem(
                                      child: Text("Hall"),
                                      value: "Hall",
                                    ),
                                  ],
                                  onChanged: (value) =>
                                      data.addressType = value.toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextWithLabel(
                          text: "Access Note",
                          validate: (String? val) => data.validator(val!),
                          textCon: data.accessNoteController,
                          node: accessNotesNode,
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
                    context: context,
                    text: "Granting Access",
                    boolean: data.isGranted,
                    function: (val) => data.setGranted(val!),
                  ),
                  checkboxRow(
                      context: context,
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
