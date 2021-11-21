import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/mobile_money_payment_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MomoInformation extends StatefulWidget {
  static String id = "storage momo info";
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
    Config.init(context);
    // TODO: implement build
    return Consumer<MomoInformationProvider>(
      builder: (context, data, child) {
        return Scaffold(
          body: Container(
            width: Config.width,
            height: Config.height! / 2,
            child: Form(
              key: data.key,
              child: Column(
                children: [
                  TextWithLabel(
                    validate: (val) => data.validate(val!),
                    text: "Mobile Money Name",
                    textCon: data.momoUser,
                  ),
                  TextWithLabel(
                      validate: (val) => data.validate(val!),
                      text: "Mobile Money Number",
                      textCon: data.momoNum,
                      type: TextInputType.phone),
                  CustomButton(
                      text: "Finalize",
                      onPressed: () => data.validation(
                            con: context,
                          ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
