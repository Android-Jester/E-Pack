import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';
import 'package:equatable/equatable.dart';

class DeliveryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends DeliveryState {}

class LoadedState extends DeliveryState {
  final StorageRequest result;

  LoadedState(this.result);
}

class ErrorState extends DeliveryState {
  final String message;

  ErrorState(this.message);
}
