import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'login_test_event.dart';
part 'login_test_state.dart';
class LoginTestBloc extends Bloc<LoginTestEvent, LoginTestState> {
  LoginTestBloc() : super(LoginTestInitial());

  @override
  Stream<LoginTestState> mapEventToState(
    LoginTestEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
