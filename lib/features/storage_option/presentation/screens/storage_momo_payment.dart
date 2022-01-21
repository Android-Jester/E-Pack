import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/provider/mobile_money_payment_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StorageMomoPayment extends StatefulWidget {
  final ScrollController scroll;
  final PageController controller;
  final int currentPage;
  static String id = "MomoUser";

  StorageMomoPayment({required this.scroll, required this.currentPage, required this.controller});

  @override
  State<StorageMomoPayment> createState() => _MomoInformationState();
}

class _MomoInformationState extends State<StorageMomoPayment> {
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
    // TODO: implement build
    return Consumer<StorageMomoPaymentInfo>(
      builder: (context, data, child) {
        return SingleChildScrollView(
          child: ContainerWrapper(
            padding: EdgeInsets.symmetric(vertical: itemHeight(15.0)),
            width: Config.width,
            height: Config.height! / 2.3,
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  TextWithLabel(
                    validate: (val) => data.validate(val!),
                    text: "Mobile Money Name",
                    textCon: data.momoUser,
                    type: TextInputType.name,
                  ),
                  TextWithLabel(
                      validate: (val) => data.validate(val!, isNumber: true),
                      text: "Mobile Money Number",
                      textCon: data.momoNum,
                      type: TextInputType.phone),
                  SizedBox(height: itemHeight(35.0)),
                  CustomButton(text: "Finalize", onPressed: () => data.validation(context: context))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
