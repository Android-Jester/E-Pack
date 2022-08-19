import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String email;
  final bool registered;

  const LoginResponse({
    required this.registered,
    required this.email,
  });


  @override
  List<Object?> get props => [registered, email];

}