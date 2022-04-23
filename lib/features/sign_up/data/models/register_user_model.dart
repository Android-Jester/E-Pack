
import '../../domain/entities/registering_user.dart';

class RegisterUserModel extends RegisterUser {
  final String email;
  final String password;
  final String name;

  RegisterUserModel(
      {required this.email, required this.password, required this.name})
      : super(email: email, password: password, name: name);
}
