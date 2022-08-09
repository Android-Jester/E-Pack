part of 'delivery_cubit.dart';

abstract class DeliveryState extends Equatable {
  const DeliveryState();
}

class DeliveryInitial extends DeliveryState {
  @override
  List<Object> get props => [];
}

class DeliveryError extends DeliveryState {
  final String errorMessage;

  DeliveryError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}

class DeliveryLoaded extends DeliveryState {
  final String successString;

  DeliveryLoaded({required this.successString});
  @override
  List<Object?> get props => [successString];
}

class DeliveryLoading extends DeliveryState {
  @override
  List<Object?> get props => [];
}
