import 'package:e_pack/features/sign_up/data/datasources/register_server.dart';
import 'package:e_pack/features/sign_up/data/repositories/registration_repo_impl.dart';
import 'package:e_pack/features/sign_up/domain/usecases/register_user.dart';
import 'package:flutter/material.dart';

class SignupInfo extends ChangeNotifier {
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
      RegisteringUser(repo: RegisterRepoImpl(authServer: RegisterServerImpl()));
    }
  }
}
