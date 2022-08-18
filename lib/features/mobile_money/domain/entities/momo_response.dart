import 'package:equatable/equatable.dart';

class VerifyPaymentResponseEntity extends Equatable {
  final bool status;
  final Map<String, dynamic> data;
  VerifyPaymentResponseEntity({
    required this.status,
    required this.data
});
  

  @override
  // TODO: implement props
  List<Object?> get props => [status, data];
}
