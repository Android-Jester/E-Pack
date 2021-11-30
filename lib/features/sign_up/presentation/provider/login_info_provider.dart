import 'package:e_pack/core/presentation/pages/home_screen.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/sign_up/data/datasources/register_server.dart';
import 'package:e_pack/features/sign_up/data/repositories/registration_repo_impl.dart';
import 'package:e_pack/features/sign_up/domain/usecases/register_user.dart';
import 'package:flutter/material.dart';

class SignupInfo extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

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

  Widget builder() {
    var usecase = RegisteringUser(repo: RegisterRepoImpl(authServer: RegisterServerImpl()));
    return FutureBuilder(
        future: usecase(Params(email: email, password: password, name: name)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SuccessDialog(text: "Signed Up Successfully", routeid: HomeScreen.id);
          } else if (snapshot.hasError) {
            return ErrorDialog(retry: () => builder(), dispose: () => Navigator.pop(context));
          } else {
            return LoadingDialog();
          }
        });
  }

  validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(context: context, builder: (con) => builder());
    }
  }
}
