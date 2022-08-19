import 'package:equatable/equatable.dart';

class InitializeRequestEntity extends Equatable {
  final String email;
  final double amount;
  final String callbackUrl;

  const InitializeRequestEntity({required this.email, required this.amount, required this.callbackUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [email, amount, callbackUrl];

}