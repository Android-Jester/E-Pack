import 'package:equatable/equatable.dart';

class RegistrationResponse extends Equatable {
  final bool registrationStatus;

  const RegistrationResponse({required this.registrationStatus});

  @override
  // TODO: implement props
  List<Object?> get props => [registrationStatus];

}