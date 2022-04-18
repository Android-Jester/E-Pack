import 'package:bloc/bloc.dart';
import 'package:e_pack_final/features/sign_up/domain/usecases/register_user.dart';
import 'package:e_pack_final/features/storage_option/presentation/storage_option.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/core_usage/presentation/widgets/dialog_states.dart';
import '../../domain/entities/register_response.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final RegisteringUser signUpUser;
  SignUpCubit({required this.signUpUser}) : super(SignUpInitial());

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
    if (val!.isEmpty) return "Please enter the username";
    return null;
  }

  emailValidator(String? val) {
    if (val!.isEmpty) return "Please enter the email";
    if (!val.contains("@")) {
      return "Please type the correct email";
    }
    return null;
  }
  passwordValidator(String? val) {
    if (val!.isEmpty) {
      return "Please enter the password";
    } else {
      return null;
    }
  }

  validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_formKey.currentState!.validate()) {
        registerUser().listen((event) {
          emit(event);
          print(event);
          if (event is SignUpLoaded) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const StorageOption()));
          } else if(event is SignUpError) {
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(
                retry: () {
                  Navigator.pop(context);
                  validate(context);
                },
                dispose: () => Navigator.pop(context),
              ),
            );
          } else if(event is SignUpLoading) {
            showDialog(context: context, builder: (_) => const LoadingDialog());
          }
        });
      }
    }
  }

  Stream<SignUpState> registerUser() async* {
    var loginStream = await signUpUser(
        params: Params(
          email: emailcontroller.text,
          password: passwordcontroller.text, name: userNamecontroller.text,
        ));
    yield SignUpLoading();
    yield* loginStream.fold(

            (error) async* {
          yield SignUpError(errorMessage: error.toString());
        },
            (right) async* {
          yield SignUpLoading();
          yield SignUpLoaded(response: right);
        });
  }
}
