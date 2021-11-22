import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';

class AuthUserModel extends AuthUser {
  final String email;
  final String password;

  AuthUserModel({required this.email, required this.password})
      : super(email: email, password: password);
}
