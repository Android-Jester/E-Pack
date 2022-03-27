import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';

class LoginModel extends AuthUser {
  LoginModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );

  factory LoginModel.getUserLogin(String email, String password) {
    return LoginModel(email: email, password: password);
  }

  bool checkUserLoginState(String verEmail, String verPassword) => (email == verEmail && password == verPassword);
}
