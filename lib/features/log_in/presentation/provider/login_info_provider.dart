import 'package:flutter/material.dart';



class LoginInfo extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  emailvalidator(String? val) {
    if (val!.isEmpty) return "Please enter the email";
    if (!val.contains("@")) {
      return "Please type the correct email";
    }
    return null;
  }

  validate() {
    if(_formKey.currentState!.validate()) {

    }
  }
}
