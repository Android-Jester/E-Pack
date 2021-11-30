import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/log_in/data/datasources/auth_server.dart';
import 'package:e_pack/features/log_in/data/repositories/authentication_repo_impl.dart';
import 'package:e_pack/features/log_in/domain/usecases/auth_user.dart';
import 'package:flutter/material.dart';

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

  Widget builder() {
    var usecase = AuthenticatingUser(repo: AuthRepoImpl(authServer: AuthServerImpl()));
    return FutureBuilder(
        future: usecase(Params(email: email, password: password)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SuccessDialog(
              routeid: HomeScreen.id,
              text: "Logged In Successfully",
            );
          } else {
            if (snapshot.hasError) {
              return ErrorDialog(
                retry: () {
                  builder();
                  Navigator.pop(context);
                },
                dispose: () => Navigator.pop(context),
              );
            } else {
              return LoadingDialog();
            }
          }
        });
  }

  validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      AuthenticatingUser(repo: AuthRepoImpl(authServer: AuthServerImpl()));
      showDialog(
          context: context,
          builder: (con) {
            return builder();
          });
    }
  }
}
