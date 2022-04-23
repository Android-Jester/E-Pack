import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final bool registered;

  LoginResponse({required this.registered});


  @override
  List<Object?> get props => [registered];

}