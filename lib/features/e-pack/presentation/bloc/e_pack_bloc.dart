import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'e_pack_event.dart';
part 'e_pack_state.dart';
class EPackBloc extends Bloc<EPackEvent, EPackState> {
  EPackBloc() : super(EPackInitial());
  @override
  Stream<EPackState> mapEventToState(
    EPackEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
