import 'package:flutter/material.dart';

import 'bloc/login_state.dart';

class LoginInfo extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  bool isLoading = false;
  bool isLoaded = false;

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  String get email => emailcontroller.text;
  String get password => passwordcontroller.text;

  emailvalidator(String? val) {
    if (val!.isEmpty) return "Please enter the email";
    if (!val.contains("@")) {
      return "Please type the correct email";
    }
    return null;
  }

  validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      LoginState(context: context).authentication(email: email, password: password);
    }
  }
}
