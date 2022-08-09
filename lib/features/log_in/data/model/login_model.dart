
import '../../domain/entities/authenticating_user.dart';

class LoginModel extends AuthUser {
  LoginModel({
    required String email,
    required String password,
  }) : super(
          email: email,
          password: password,
        );

  Map<String, dynamic> toJSON() => {
    "email": email,
    "password": password,
  };
}
