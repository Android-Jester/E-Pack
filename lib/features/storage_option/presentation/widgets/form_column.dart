import 'package:flutter/cupertino.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/function/validators.dart';
import '../../../../core/core_usage/presentation/widgets/form_objects/drop_down.dart';
import '../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../provider/bloc/storage_cubit.dart';

class FormColumn extends StatefulWidget {
  final StorageCubit data;

  const FormColumn({
    required this.data,
    Key? key}) : super(key: key);

  @override
  State<FormColumn> createState() => _FormColumnState();
}

class _FormColumnState extends State<FormColumn> {
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: itemWidth(25)),
      child: Column(children: [
        TextWithLabel(
          text: "Name of Residence",
          validate: (val) => textValidator(val!),
          textCon: widget.data.residenceNameController,
          type: TextInputType.name,
          node: residenceNode,
          nextNode: roomNode,
        ),
        TextWithLabel(
          text: "Room or Flat Number",
          validate: (val) => numberValidator(val!),
          textCon: widget.data.roomNumController,
          type: TextInputType.number,
          node: roomNode,
          nextNode: phoneNode,
        ),
        TextWithLabel(
          text: "Mobile Number",
          validate: (val) => numberValidator(val!),
          textCon: widget.data.mobileNumController,
          type: TextInputType.phone,
          node: phoneNode,
        ),
        DropDownObjects(cubit: widget.data),
        TextWithLabel(
          text: "Access Note",
          textCon: widget.data.accessNoteController,
          node: accessNotesNode,
        ),
      ]),
    );
  }
}