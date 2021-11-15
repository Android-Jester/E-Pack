import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  final String email;
  final String password;

  AuthUser({
    required this.email,
    required this.password,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}
