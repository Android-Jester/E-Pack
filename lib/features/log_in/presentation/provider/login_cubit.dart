import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_response.dart';
import '../../domain/usecases/auth_user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthenticatingUser authUser;
  LoginCubit({
    required this.authUser,
  }) : super(LoginInitial());
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

  validate(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      await loginUser();
    }
  }

  Future<void> loginUser() async {
    print("PRESSED");
    emit(LoginLoading());
    var loginStream = await authUser(
        params: Params(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    ));
    emit(LoginLoading());
    return loginStream.fold(
      (error) => emit(LoginError(errorMessage: error.toString())),
      (right) => emit(LoginLoaded(message: right)),
    );
  }
}
