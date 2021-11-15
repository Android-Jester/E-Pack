import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/provider/mobile_money_payment_info.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MomoInformation extends StatefulWidget {
  static String id = "MomoUser";
  final void Function()? function;

  MomoInformation({Key? key, required this.function}) : super(key: key);
  @override
  State<MomoInformation> createState() => _MomoInformationState();
}

class _MomoInformationState extends State<MomoInformation> {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    // TODO: implement build
    return Consumer<MomoInformationProvider>(
      builder: (context, data, child) {
        return Container(
          width: Config.width,
          height: Config.height! / 2,
          child: Form(
            key: data.key,
            child: Column(
              children: [
                textWithLabel(
                  validate: (val) => data.validate(isNumber: false),
                  text: "Mobile Money Name",
                  controller: data.momoUser,
                ),
                textWithLabel(
                    validate: (val) => data.validate(isNumber: true),
                    text: "Mobile Money Number",
                    controller: data.momoNum,
                    type: TextInputType.phone),
                CustomButton(
                    text: "Finalize",
                    onPressed: () {
                      data.validation(
                          context: context, function: widget.function);
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
