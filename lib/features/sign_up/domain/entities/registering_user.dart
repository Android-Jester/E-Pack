import 'package:equatable/equatable.dart';

class RegisterUser extends Equatable {
  final String email;
  final String password;
  final String name;

  RegisterUser(
      {required this.email, required this.password, required this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [email, password, name];
}
