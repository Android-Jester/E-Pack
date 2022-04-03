import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  // Text Controllers to get info
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController userNamecontroller = TextEditingController();

  String get email => emailcontroller.text;
  String get name => userNamecontroller.text;
  String get password => passwordcontroller.text;

  userNameValidator(String? val) {
    if (val!.isEmpty) return "Please enter the email";
    return null;
  }

  emailvalidator(String? val) {
    if (val!.isEmpty) return "Please enter the email";
    if (!val.contains("@")) {
      return "Please type the correct email";
    }
    return null;
  }

  validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {}
  }
}
