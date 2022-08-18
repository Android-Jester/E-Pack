part of 'momo_request_cubit.dart';

abstract class PaymentRequestState extends Equatable {
  const PaymentRequestState();
}

class PaymentRequestInitial extends PaymentRequestState {
  @override
  List<Object> get props => [];
}

class PaymentRequestLoading extends PaymentRequestState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PaymentRequestError extends PaymentRequestState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PaymentRequestLoaded extends PaymentRequestState {
  final String url;
  final String reference;

  const PaymentRequestLoaded({required this.reference, required this.url});
  @override
  // TODO: implement props
  List<Object?> get props => [reference];

}


class VerifyTransactionLoaded extends PaymentRequestState {
  final bool status;

  const VerifyTransactionLoaded(this.status);
  @override
  List<Object?> get props => [];

}
