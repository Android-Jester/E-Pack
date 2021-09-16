import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'requestbuilder_event.dart';
part 'requestbuilder_state.dart';
class RequestbuilderBloc extends Bloc<RequestbuilderEvent, RequestbuilderState> {
  RequestbuilderBloc() : super(RequestbuilderInitial());
  @override
  Stream<RequestbuilderState> mapEventToState(
    RequestbuilderEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
