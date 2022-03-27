import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
