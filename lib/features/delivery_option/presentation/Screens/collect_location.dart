//TODO: collection of location info

import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/check_box_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/collection_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CollectionPage extends StatefulWidget {
  final PageController? controller;
  final int currentPage;

  CollectionPage({
    required this.controller,
    required this.currentPage,
  });
  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage>
    with AutomaticKeepAliveClientMixin {
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
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        itemHeight(10),
      ),
    );
    Config.init(context);
    return Consumer<CollectionInfo>(
      builder: (context, data, _) {
        return SingleChildScrollView(
          child: Container(
            width: Config.width,
            height: Config.height,
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  SizedBox(
                    height: itemHeight(5.0),
                  ),
                  TextWithLabel(
                    text: "Name of Residence",
                    validate: (val) => data.validator(val!),
                    textCon: data.residenceNameController,
                    type: TextInputType.name,
                    node: residenceNode,
                    nextNode: roomNode,
                  ),
                  TextWithLabel(
                    text: "Room or Flat Number",
                    validate: (val) => data.validator(val!, isNumeric: true),
                    textCon: data.roomNumController,
                    type: TextInputType.number,
                    node: roomNode,
                    nextNode: phoneNode,
                  ),
                  TextWithLabel(
                    text: "Mobile Number",
                    validate: (val) => data.validator(val!, isNumeric: true),
                    textCon: data.mobileNumController,
                    type: TextInputType.phone,
                    node: phoneNode,
                  ),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: itemWidth(30.0)),
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
                    validate: (val) => data.validator(val!, isNumeric: true),
                    textCon: data.accessNoteController,
                    node: accessNotesNode,
                  ),
                  SizedBox(height: itemHeight(10.0)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
                    child: Text(
                      "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items",
                      style: TextStyle(fontSize: itemWidth(17.0)),
                    ),
                  ),
                  checkboxRow(
                      text: "Granting Access",
                      boolean: data.isGranted,
                      function: (val) => data.setGranted(val!),
                      context: context),
                  checkboxRow(
                      context: context,
                      text: "I agree to terms and conditions",
                      boolean: data.isAgreed,
                      function: (val) => data.setAgree(val!)),
                  buttonRow(widget.controller!, widget.currentPage,
                      nextButton: () => (data.isGranted && data.isAgreed)
                          ? direction(
                              widget.controller!, widget.currentPage, true)
                          : () {
                              print("disabled");
                            })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
