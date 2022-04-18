import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final bool registrationStatus;

  LoginResponse({required this.registrationStatus});


  @override
  List<Object?> get props => [registrationStatus];

}