import 'package:e_pack_final/core/core_usage/presentation/state/core_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoreBloc extends Cubit<CoreState> {
  CoreBloc(CoreState initialState) : super(initialState);

  void reloadState() {
    emit(state);

  }

}