import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextWithLabel extends StatelessWidget {
  final String text;
  final String? Function(String? val) validate;
  final TextInputType type;
  final TextEditingController textCon;
  final FocusNode? node;
  final FocusNode? nextNode;

  TextWithLabel(
      {Key? key,
      this.node,
      this.nextNode,
      required this.text,
      required this.validate,
      this.type = TextInputType.text,
      required this.textCon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: itemHeight(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: itemWidth(15.0)),
          ),
          SizedBox(
            height: itemHeight(2.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(25.0)),
            child: TextFormField(
                autofocus: true,
                focusNode: node,
                controller: textCon,
                obscureText: (text.contains("Password")),
                smartDashesType: (type == TextInputType.phone)
                    ? SmartDashesType.enabled
                    : SmartDashesType.disabled,
                keyboardType: type,
                textAlign: TextAlign.center,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(
                //       RegExp("[a-z A-Z á-ú Á-Ú]")),
                //   (type != TextInputType.number || type != TextInputType.phone)
                //       ? FilteringTextInputFormatter.deny(RegExp("[0-9]"))
                //       : FilteringTextInputFormatter.deny(
                //           RegExp("[a-z A-Z á-ú Á-Ú]")),
                // ],
                onEditingComplete: () {
                  print(textCon.text);
                  (nextNode != null)
                      ? FocusScope.of(context).requestFocus(nextNode)
                      : print("null");
                },
                validator: validate,
                decoration: inputDecoration),
          ),
        ],
      ),
    );
  }
}
