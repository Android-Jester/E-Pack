import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/storage_option/presentation/provider/mobile_money_payment_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StorageMomoPayment extends StatefulWidget {
  static String id = "storage momo info";
  @override
  State<StorageMomoPayment> createState() => _MomoInformationState();
}

class _MomoInformationState extends State<StorageMomoPayment> {
  late FocusNode usernode;
  late FocusNode numnode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernode = FocusNode();
    numnode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernode.dispose();
    numnode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    // TODO: implement build
    return Consumer<StorageMomoPaymentInfo>(
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
                      validate: (val) => data.validate(val!, isNumber: true),
                      text: "Mobile Money Number",
                      textCon: data.momoNum,
                      type: TextInputType.phone),
                  CustomButton(
                      text: "Finalize",
                      onPressed: () => data.validation(
                            context: context,
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
