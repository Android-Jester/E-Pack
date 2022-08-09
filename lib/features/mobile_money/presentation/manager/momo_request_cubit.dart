import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'momo_request_state.dart';

class MomoRequestCubit extends Cubit<MomoRequestState> {
  MomoRequestCubit() : super(MomoRequestInitial());
}
