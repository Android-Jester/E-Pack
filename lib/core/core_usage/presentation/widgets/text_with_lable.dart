import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../configurations/sizes.dart';
import '../configurations/theme.dart';

class TextWithLabel extends StatelessWidget {
  final String text;
  final String? hintText;
  final String? Function(String? val)? validate;
  final void Function(String? val)? textEditing;
  final TextInputType type;
  final TextEditingController textCon;
  final Icon? preIcon, suffixIcon;
  final FocusNode? node;
  final FocusNode? nextNode;

 const TextWithLabel({
    Key? key,
    this.node,
    this.nextNode,
    this.hintText,
    this.preIcon,
    this.suffixIcon,
    required this.text,
    this.validate,
    this.type = TextInputType.text,
    required this.textCon,
    this.textEditing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: itemHeight(10.0), left: itemWidth(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: itemHeight(5),
              horizontal: itemWidth(20.0),
            ),
            child: TextFormField(
                autofocus: true,
                focusNode: node,
                controller: textCon,
                obscureText: (text.contains("Password")),
                smartDashesType: (type == TextInputType.phone)
                    ? SmartDashesType.enabled
                    : SmartDashesType.disabled,
                keyboardType: type,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onChanged: textEditing,
                onEditingComplete: () {
                  (nextNode != null)
                      ? FocusScope.of(context).requestFocus(nextNode)
                      : FocusScope.of(context).unfocus();
                },
                style: TextStyle(fontSize: itemHeight(16.0)),
                validator: validate,
                decoration: InputDecoration(
                    prefixIcon: preIcon,
                    hintText: hintText,
                    label: Text(text),
                    filled: true,
                    border: border,
                    errorBorder: border,
                    disabledBorder: border,
                    focusedBorder: border,
                    focusedErrorBorder: border)),
          ),
        ],
      ),
    );
  }
}
