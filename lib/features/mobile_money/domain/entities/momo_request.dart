import 'package:equatable/equatable.dart';

class VerifyPaymentRequestEntity extends Equatable {
  final String reference;

  const VerifyPaymentRequestEntity({required this.reference});

  @override
  // TODO: implement props
  List<Object?> get props => [reference];
}
