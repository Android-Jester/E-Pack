//TODO: collection of location info



import 'package:e_pack_final/core/core_usage/presentation/widgets/check_boxes_agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/configurations/theme.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/options/check_box.dart';
import '../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../../../storage_option/presentation/provider/bloc/storage_cubit.dart';
import '../provider/bloc/delivery_cubit.dart';
import '../widget/drop_down.dart';

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
                  CheckBoxesAgreements(cubit: bloc),
                  ButtonRow(
                      pageController: widget.controller,
                      currentPage: widget.currentPage,
                      scroll: widget.scroll,
                      nextAction: () => bloc.allValidation(
                        scroll: widget.scroll,
                        controller: widget.controller,
                        currentPage: widget.currentPage,
                        key: bloc.infoCollectionKey,
                        context: context,
                      )),
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
        DropDownObjects(cubit: data),
        TextWithLabel(
          text: "Access Note",
          // validate: (val) => data.validator(val!, isNumeric: true),
          textCon: data.accessNoteController,
          node: accessNotesNode,
        ),
      ]),
    );
  }


  @override
  bool get wantKeepAlive => true;
}


