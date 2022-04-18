import 'package:e_pack_final/features/storage_option/presentation/storage_option.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/widgets/dialog_states.dart';
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
      loginUser().listen((event) {
        emit(event);
        print(event);
        if (event is LoginLoaded) {
          print("SUCCESS");
          Navigator.push(context, MaterialPageRoute(builder: (context) => const StorageOption()));
        } else if(event is LoginError) {
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
        } else if(event is LoginLoading) {
          showDialog(
              context: context,
              builder: (_) {
                return const LoadingDialog();
              },
          );
        }
      });
    }
  }

  Stream<LoginState> loginUser() async* {
    var loginStream = await authUser(
        params: Params(
      email: emailcontroller.text,
      password: passwordcontroller.text,
    ));
    yield LoginLoading();
    yield* loginStream.fold(

      (error) async* {
      yield LoginError(errorMessage: error.toString());
    },
    (right) async* {
      yield LoginLoading();
      yield LoginLoaded(message: right);
    });
  }
}
