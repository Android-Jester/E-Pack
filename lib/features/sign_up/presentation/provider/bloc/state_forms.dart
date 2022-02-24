import 'package:e_pack/features/sign_up/domain/entities/registering_user.dart';
import 'package:equatable/equatable.dart';

class DeliveryState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadingState extends DeliveryState {}

class LoadedState extends DeliveryState {
  final RegisterUser result;

  LoadedState(this.result);
}

class ErrorState extends DeliveryState {
  final String message;

  ErrorState(this.message);
}
