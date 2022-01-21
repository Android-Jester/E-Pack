import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class MomoInformationProvider extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = MaskedTextController(mask: "(000)-000-0000");

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();
  get key => _formKey;

  // Validates the TextFields
  validation({required BuildContext con, required PageController controller, required int currentPage}) {
    if (_formKey.currentState!.validate()) {
      // TODO: Set Dialog to Show Result
    }
  }

  // Sets conditions for validation to be true
  validate(String val, {bool isNumber = false}) {
    if (val == " ") {
      return "There is no username or value";
    } else {
      return (isNumber == true && val.length < 10) ? "The number is incomplete" : null;
    }
  }
}
