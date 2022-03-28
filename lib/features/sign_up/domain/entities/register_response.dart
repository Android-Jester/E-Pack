import 'package:equatable/equatable.dart';

class RegistrationResponse extends Equatable {
  final bool registrationStatus;

  RegistrationResponse({required this.registrationStatus});

  @override
  // TODO: implement props
  List<Object?> get props => [registrationStatus];

}