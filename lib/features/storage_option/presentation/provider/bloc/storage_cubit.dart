import 'package:bloc/bloc.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../../core/core_usage/presentation/function/scroll_movement.dart';
import '../../../domain/usecases/send_storage_request.dart';

part 'storage_state.dart';

class StorageCubit extends Cubit<StorageState> {
  final SendStorageRequest sendStorageData;
  StorageCubit({required this.sendStorageData}) : super(StorageInitial());

  TextEditingController largeBoxController =
  TextEditingController(text: "0");
  TextEditingController mediumBoxController =
  TextEditingController(text: "0");
  TextEditingController smallBoxController =
  TextEditingController(text: "0");
  TextEditingController residenceNameController = TextEditingController();
  TextEditingController roomNumController = TextEditingController();
  TextEditingController mobileNumController = MaskedTextController(mask: "(000)-000-0000");
  TextEditingController accessNoteController = TextEditingController();
  TextEditingController momoUser = TextEditingController();
  TextEditingController momoNum = MaskedTextController(mask: "(000)-000-0000");
  TextEditingController locationAddressController = TextEditingController();
  TextEditingController roomNumberController = TextEditingController();
  TextEditingController phoneNumberController = MaskedTextController(mask: "(000)-000-0000");
  TextEditingController whatsAppNumberController = MaskedTextController(mask: "(000)-000-0000");
  TextEditingController contactTimesController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController timeDate = TextEditingController();
  String dateTimeVal = " ";
  final collectKey = GlobalKey<FormState>();
  final key = GlobalKey<FormState>();
  bool isGranted = false;
  bool isAgreed = false;
  String addressType = "Hostel";
  int roomType = 0;


void validation(ScrollController scroll, PageController page, int pageIndex) {
  smoothScrollToTop(scroll);
  direction(page, pageIndex, true);
}

void onDateChange(String value) {
  timeDate = TextEditingController(text: "$value");
  dateTimeVal = value;

}


String? textValidator(String val) {
  if(val.isEmpty) {
    return "This is Empty";
  } else {
    return null;
  }
}
String? numberValidator(String val, ){
}
String? phoneNumberValidator(String val, ){
}

  void changeValue(int val) => roomType = val;



Future<void> sendStorageInfo() async {
  // var usecase = await sendStorageData(
  //   params: Params(
  //       timeCollect: dateTimeVal,
  //       collectRoomType: addressType,
  //       residenceName: residenceNameController.text,
  //       roomNumber: roomNumberController.text,
  //       phoneNumber: mobileNumController.text,
  //       accessNote: accessNoteController.text,
  //
  //   )
  // );
}


}
