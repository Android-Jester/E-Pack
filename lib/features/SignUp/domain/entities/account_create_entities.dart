import 'package:equatable/equatable.dart';

class UserAccount extends Equatable {
  final String? firstName, lastName, email, password;

  UserAccount({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
      ];
}
