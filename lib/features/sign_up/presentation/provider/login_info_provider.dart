import 'package:e_pack/features/log_in/data/repositories/authentication_repo_impl.dart';
import 'package:e_pack/features/log_in/domain/usecases/auth_user.dart';
import 'package:flutter/material.dart';

import '../../../../injector.dart';

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
    if (_formKey.currentState!.validate()) {
      AuthenticatingUser(repo: sl<AuthRepoImpl>());
    }
  }
}
