//TODO: collection of location info

import 'package:e_pack_final/core/core_usage/presentation/screen/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/configurations/theme.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/options/check_box.dart';
import '../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../provider/bloc/storage_cubit.dart';

class StorageCollectionInfo extends StatefulWidget {
  final PageController controller;
  final int currentPage;
  final ScrollController scroll;

  StorageCollectionInfo({required this.controller, required this.currentPage, required this.scroll});
  @override
  State<StorageCollectionInfo> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<StorageCollectionInfo> with AutomaticKeepAliveClientMixin {
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
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocConsumer<StorageCubit, StorageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ContainerWrapper(
            width: Config.width,
            height: Config.height,
            child: Form(
              key: data.collectKey,
              child: Column(
                children: [
                  formColumn(data),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(15.0)),
                    child: Text(
                      "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items",
                      style: TextStyle(fontSize: itemWidth(17.0)),
                    ),
                  ),
                  checkBoxColumn(data),
                  buttonRow(widget.controller, widget.currentPage, nextButton: () {
                    data.validation(widget.scroll, widget.controller, widget.currentPage);
                  })
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {

      }
    );
  }

  Widget formColumn(StorageCubit data) {
    List<String> value = [
      "Hostel",
      "Homestel",
      "Apartment",
      "Flat",
      "Hall"
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemWidth(25)),
      child: Column(children: [
        TextWithLabel(
          text: "Name of Residence",
          validate: (val) => data.textValidator(val!),
          textCon: data.residenceNameController,
          type: TextInputType.name,
          node: residenceNode,
          nextNode: roomNode,
        ),
        TextWithLabel(
          text: "Room or Flat Number",
          validate: (val) => data.numberValidator(val!),
          textCon: data.roomNumController,
          type: TextInputType.number,
          node: roomNode,
          nextNode: phoneNode,
        ),
        TextWithLabel(
          text: "Mobile Number",
          validate: (val) => data.numberValidator(val!),
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
                  items: List.generate(value.length, (i) => DropdownMenuItem(
                     child: Text(value[i]),
                     value: value[i],
                  )),
                  onChanged: (value) => data.addressType = value.toString(),
                ),
              ),
            ],
          ),
        ),
        TextWithLabel(
          text: "Access Note",
          textCon: data.accessNoteController,
          node: accessNotesNode,
        ),
      ]),
    );
  }

  Widget checkBoxColumn(StorageCubit data) {
    List<String> options = [
      "Granting Access to Storage",
      "Agreement to Terms and Conditions"
    ];
    List<bool> agreements = [
      data.isAgreed,
      data.isGranted,
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemHeight(5)),
      child: Column(
        children: List.generate(
          options.length,
            (i) => CheckBoxRow(
                  text: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => TermsAndConditions()));
                    },
                    child: Text(
                      options[i],
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 15.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  checkValue: agreements[i],
                  function: (val)=> setState(() {
                    agreements[i] = val!;
                  }),
                ),
        ),
        // children:
        //   CheckBoxRow(
        //     text: "I agree to terms and conditions",
        //     function: (val) => data.isAgreed = val!,
        //     checkValue: data.isAgreed,
        //   ),
        // ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
