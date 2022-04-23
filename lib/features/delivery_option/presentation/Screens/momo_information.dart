import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/custom_button.dart';
import '../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../provider/bloc/delivery_cubit.dart';

class MomoInformation extends StatefulWidget {
  final ScrollController scroll;
  final PageController controller;
  final int currentPage;
  static String id = "MomoUser";

  MomoInformation(this.scroll, this.currentPage, this.controller);

  @override
  State<MomoInformation> createState() => _MomoInformationState();
}

class _MomoInformationState extends State<MomoInformation> {
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
    var data = BlocProvider.of<DeliveryCubit>(context);
    Config.init(context);
    // TODO: implement build
    return SingleChildScrollView(
          child: ContainerWrapper(
            padding: EdgeInsets.symmetric(vertical: itemHeight(15.0)),
            width: Config.width,
            height: Config.height! / 2.3,
            child: Form(
              key: data.momoKey,
              child: Column(
                children: [
                  TextWithLabel(
                    validate: (val) => data.deliveryInfoValidator(val!),
                    text: "Mobile Money Name",
                    textCon: data.momoUser,
                    type: TextInputType.name,
                  ),
                  TextWithLabel(
                      // validate: (val) => data.deliveryInfoValidator(val!, isNumber: true),
                      text: "Mobile Money Number",
                      textCon: data.momoNum,
                      type: TextInputType.phone),
                  SizedBox(height: itemHeight(35.0)),
                  CustomButton(
                      text: "Finalize",
                      onPressed: () => data.deliveryInfoValidation(context: context, controller: widget.controller, currentPage: widget.currentPage, scroll: ScrollController()))
                ],
              ),
            ),
          ),
        );
  }
}
