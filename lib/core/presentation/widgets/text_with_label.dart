import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextWithLabel extends StatelessWidget {
  final String text;
  final String? Function(String? val)? validate;
  final TextInputType type;
  final TextEditingController textCon;
  final FocusNode? node;
  final FocusNode? nextNode;

  TextWithLabel({Key? key, this.node, this.nextNode, required this.text, this.validate, this.type = TextInputType.text, required this.textCon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: itemHeight(10.0), left: itemWidth(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: itemWidth(10.0)),
            child: Text(
              text,
              style: TextStyle(fontSize: itemHeight(14.0)),
            ),
          ),
          SizedBox(
            height: itemHeight(2.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
            child: TextFormField(
                autofocus: true,
                focusNode: node,
                controller: textCon,
                obscureText: (text.contains("Password")),
                smartDashesType: (type == TextInputType.phone) ? SmartDashesType.enabled : SmartDashesType.disabled,
                keyboardType: type,
                textAlign: TextAlign.center,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onEditingComplete: () {
                  (nextNode != null) ? FocusScope.of(context).requestFocus(nextNode) : FocusScope.of(context).unfocus();
                },
                style: TextStyle(fontSize: itemHeight(14.0)),
                validator: validate,
                decoration: inputDecoration.copyWith()),
          ),
        ],
      ),
    );
  }
}
// Stack(children: <Widget>[
// Container(
// width: MediaQuery.of(context).size.width,
// height: 58.0,
// margin: EdgeInsets.symmetric(vertical: 6.0),
// // height: 50.0,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(24.0),
// boxShadow: [BoxShadow(spreadRadius: 0.5, blurRadius: 10, color: Color.fromRGBO(5, 27, 178, 0.32), offset: Offset(0, 5))]),
// ),
// buildTextField(context),
// Container(
// height: 70.0,
// width: 70.0,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// color: Colors.white,
// boxShadow: [BoxShadow(spreadRadius: 0.5, offset: Offset(0, 5), color: Color.fromRGBO(5, 27, 178, 0.32), blurRadius: 10)]),
// child: Padding(
// padding: EdgeInsets.all(12.0),
// child: Icon(icon),
// ),
// )
// ]);
