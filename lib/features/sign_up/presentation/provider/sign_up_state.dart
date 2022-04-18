part of 'sign_up_cubit.dart';

@immutable
abstract class SignUpState extends Equatable {}

class SignUpInitial extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SignUpLoading extends SignUpState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class SignUpLoaded extends SignUpState {
  final RegistrationResponse response;
  SignUpLoaded({required this.response});
  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
class SignUpError extends SignUpState {
  final String errorMessage;
  SignUpError({required this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
