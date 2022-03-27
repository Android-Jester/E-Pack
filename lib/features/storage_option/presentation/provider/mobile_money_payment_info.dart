import 'package:e_pack/features/storage_option/presentation/provider/bloc/storage_state.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class StorageMomoPaymentInfo extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = MaskedTextController(mask: "(000)-000-0000");

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  validation({required BuildContext context}) {
    if (_formKey.currentState!.validate()) {
      StorageState(context: context).sendRequest();
    }
  }

  validate(String val, {bool isNumber = false}) {
    if (val == " ") {
      return "There is no username or value";
    } else {
      return (isNumber == true && val.length < 14 || isNumber == true && val.length > 14) ? "The number is incomplete" : null;
    }
  }
}
