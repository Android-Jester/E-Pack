//TODO: collection of location info

import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/check_box_row.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../provider/bloc/delivery_cubit.dart';

class CollectionData extends StatefulWidget {
  final PageController controller;
  final int currentPage;
  final ScrollController scroll;

  CollectionData({required this.controller, required this.currentPage, required this.scroll});
  @override
  State<CollectionData> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionData> with AutomaticKeepAliveClientMixin {
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
    var bloc = BlocProvider.of<DeliveryCubit>(context);
    return SingleChildScrollView(
          child: ContainerWrapper(
            width: Config.width,
            height: Config.height,
            child: Form(
              key: bloc.infoCollectionKey,
              child: Column(
                children: [
                  formColumn(data: bloc),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(15.0)),
                    child: Text(
                      "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items",
                      style: TextStyle(fontSize: itemWidth(17.0)),
                    ),
                  ),
                  checkBoxColumn(data: bloc),
                  buttonRow(widget.controller, widget.currentPage, nextButton: () {
                    bloc.allValidation(widget.scroll, widget.controller, widget.currentPage);
                  })
                ],
              ),
            ),
          ),
        );
  }

  Widget formColumn({required DeliveryCubit data}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemWidth(25)),
      child: Column(children: [
        TextWithLabel(
          text: "Name of Residence",
          validate: (val) => data.collectValidator(val!),
          textCon: data.residenceNameController,
          type: TextInputType.name,
          node: residenceNode,
          nextNode: roomNode,
        ),
        TextWithLabel(
          text: "Room or Flat Number",
          validate: (val) => data.collectValidator(val!, isNumeric: true),
          textCon: data.roomNumberController,
          type: TextInputType.number,
          node: roomNode,
          nextNode: phoneNode,
        ),
        TextWithLabel(
          text: "Mobile Number",
          validate: (val) => data.collectValidator(val!, isNumeric: true),
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
              SizedBox(height: itemHeight(2.5)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(30.0)),
                child: DropdownButtonFormField(
                  decoration: inputDecoration(context),
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
                  onChanged: (value) => data.addressType = value.toString(),
                ),
              ),
            ],
          ),
        ),
        TextWithLabel(
          text: "Access Note",
          // validate: (val) => data.validator(val!, isNumeric: true),
          textCon: data.accessNoteController,
          node: accessNotesNode,
        ),
      ]),
    );
  }

  Widget checkBoxColumn({required DeliveryCubit data}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemHeight(5)),
      child: Column(
        children: [
          CheckBoxRow(
            text: "Granting Access",
            checkValue: data.isGranted,
            function: (val) => data.isGranted = val!,
          ),
          CheckBoxRow(
            text: "I agree to terms and conditions",
            function: (val) => data.isAgreed = val!,
            checkValue: data.isAgreed,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
