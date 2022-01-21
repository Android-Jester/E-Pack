import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:equatable/equatable.dart';

class DeliveryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class LoadingState extends DeliveryState {}
class LoadedState extends DeliveryState {
  final DeliveryRequest result;

  LoadedState(this.result);
}
class ErrorState extends DeliveryState {
  final String message;

  ErrorState(this.message);
}
