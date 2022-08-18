import 'package:equatable/equatable.dart';

class InitializeRequestEntity extends Equatable {
  final String email;
  final double amount;

  const InitializeRequestEntity({required this.email, required this.amount});

  @override
  // TODO: implement props
  List<Object?> get props => [email, amount];

}