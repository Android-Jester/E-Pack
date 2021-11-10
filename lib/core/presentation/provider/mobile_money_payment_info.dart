import 'package:flutter/material.dart';

class MobileMoneyPaymentInfo extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = TextEditingController();

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  validation(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return Column(
              children: [
                Container(
                  color: Colors.blue,
                ),
              ],
            );
          });
    }
  }

  validate([bool isNumber = false]) {
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
