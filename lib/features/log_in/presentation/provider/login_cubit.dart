import 'package:bloc/bloc.dart';
import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/log_in/domain/entities/login_response.dart';
import 'package:e_pack/features/log_in/domain/usecases/auth_user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
          showDialog(context: context, builder: (_) => const LoadingDialog());
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
