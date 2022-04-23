import 'package:bloc/bloc.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/dialog_states.dart';
import 'package:e_pack_final/features/storage_option/domain/repositories/storage_request_repo.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../../core/core_usage/presentation/function/scroll_movement.dart';
import '../../../../../injector.dart';
import '../../../../delivery_option/presentation/provider/bloc/delivery_cubit.dart';
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
  TextEditingController storagePeriodController = TextEditingController();
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
  double cost = 0;


  calculateCost() {
    cost = (
        10.0*(double.parse(storagePeriodController.text)) // storage period
      + 10.0*(int.parse(smallBoxController.text)) // small boxes
      + 10.0*(int.parse(mediumBoxController.text)) // medium boxes
      + 10.0*(int.parse(largeBoxController.text)) //large boxes
    );
  }

  // Keys
  final collectKey = GlobalKey<FormState>();
  final contactKey = GlobalKey<FormState>();
  final initialKey = GlobalKey<FormState>();

  bool isGranted = false;
  bool isAgreed = false;
  String addressType = "Hostel";
  int roomType = 0;


void validation(BuildContext context, ScrollController scroll, PageController page, int pageIndex, GlobalKey<FormState> keys) {
  if(keys.currentState!.validate()) {
    direction(page, scroll, pageIndex, true);
  }
  else {showDialog(context: context, builder: (_) => WarningDialog(text: "Please Enter Value"));}
}

  List<String> addressValue = [
    "Hostel",
    "Homestel",
    "Apartment",
    "Flat",
    "Hall"
  ];




  void changeValue(int val) => roomType = val;



Future<void> sendStorageInfo() async {
  var usecase = await sendStorageData(
    params: Params(
        timeCollect: dateTimeVal,
        collectRoomType: storagePeriodController.text,
        residenceName: residenceNameController.text,
        roomNumber: roomNumberController.text,
        phoneNumber: mobileNumController.text,
        accessNote: accessNoteController.text,
        addressType: addressType,
        smallBoxSizeCount: int.parse(smallBoxController.text),
        mediumBoxSizeCount: int.parse(mediumBoxController.text),
        largeBoxSizeCount: int.parse(largeBoxController.text),
        contactTimes: contactTimesController.text,
        localPhoneNum: phoneNumberController.text,
      whatsPhoneNum: whatsAppNumberController.text,
      locationName: locationAddressController.text,
      momoFullName: locator.get<StorageRequestRepository>().username,
      momoPhoneNum: momoNum.toString(),
      cost: cost,
    )
  );
}


}
