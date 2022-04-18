part of 'login_cubit.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoginError extends LoginState {
  final String errorMessage;

  LoginError({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [
    errorMessage
  ];
}
class LoginLoaded extends LoginState {
  final LoginResponse message;

  LoginLoaded({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
class LoginLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
