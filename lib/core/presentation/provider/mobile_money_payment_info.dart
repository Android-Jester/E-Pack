import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MomoInformationProvider extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = TextEditingController();

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  validation({required BuildContext context, required Function()? function}) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext context) => SimpleDialog(
                title: Text("Have you completed everything?"),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(text: "Yes", onPressed: function),
                      CustomButton(
                          text: "No", onPressed: () => Navigator.pop(context))
                    ],
                  ),
                ],
              ));
    }
  }

  validate({required bool isNumber}) {
    if (_momoUser.text == null && _momoNum.text == null) {
      return "There is no username or value";
    } else {
      if (isNumber == true && _momoNum.text.length < 10) {
        return "The number is incomplete";
      }
      return null;
    }
  }
}
