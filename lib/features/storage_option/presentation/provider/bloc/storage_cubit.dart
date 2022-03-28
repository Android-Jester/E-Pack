import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  StorageCubit() : super(StorageInitial());



}
