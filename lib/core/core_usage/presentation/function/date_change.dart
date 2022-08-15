import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import '../../../../features/storage_option/presentation/provider/bloc/storage_cubit.dart';

void onDateChange(String value, Cubit cubit) {
  if(cubit is StorageCubit) {
    cubit.timeDate = TextEditingController(text: "$value");
    cubit.dateTimeVal = value;
  } else if(cubit is DeliveryCubit) {
    cubit.timeDate = TextEditingController(text: "$value");
    cubit.dateTimeVal = value;
  }

}