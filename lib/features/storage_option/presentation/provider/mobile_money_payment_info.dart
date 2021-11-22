import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:e_pack/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:e_pack/features/storage_option/presentation/provider/box_size_data.dart';
import 'package:e_pack/features/storage_option/presentation/provider/collection_info.dart';
import 'package:e_pack/features/storage_option/presentation/provider/room_type_data.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_period_data.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_recepient_info.dart';
import 'package:e_pack/features/storage_option/presentation/provider/time_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StorageMomoPaymentInfo extends ChangeNotifier {
  final TextEditingController _momoUser = TextEditingController();
  final TextEditingController _momoNum = TextEditingController();

  TextEditingController get momoUser => _momoUser;
  TextEditingController get momoNum => _momoNum;

  final _formKey = GlobalKey<FormState>();

  get key => _formKey;

  validation({required BuildContext context}) {
    //Initialized Providers
    var storageTimeProvider =
        Provider.of<StorageTimeInfo>(context, listen: false);
    var storageRoomTypeProvider =
        Provider.of<StorageRoomTypeData>(context, listen: false);
    var storagePeriodProvider =
        Provider.of<StoragePeriodInfo>(context, listen: false);
    var storageBoxSizeProvider =
        Provider.of<StorageBoxSizeData>(context, listen: false);
    var storageCollectionProvider =
        Provider.of<StorageCollectionData>(context, listen: false);
    var storageReceiptProvider =
        Provider.of<StorageRecepientInfo>(context, listen: false);

    // Initialized usecase
    var usecase = SendStorageRequest(
        StorageRequestRepositoryImpl(serverHost: StorageDataReceiverImpl()));

    // calculated cost
    double _cost = (storageBoxSizeProvider.smallBoxSizeText +
            storageBoxSizeProvider.mediumBoxSizeText +
            storageBoxSizeProvider.largeBoxSizeText)
        .toDouble();

    //verifying data
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (BuildContext con) => SimpleDialog(
                title: Text("Have you completed everything?"),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          text: "Yes",
                          onPressed: () async {
                            print("started");
                            //sending data to appwrite server and getting their results
                            var exes = usecase.call(Params(
                              timeCollect: storageTimeProvider.dateTimeVal,
                              semesterPeriod:
                                  storageTimeProvider.semesterPeriod,
                              collectRoomType:
                                  storageRoomTypeProvider.roomTypeSelected,
                              largeBoxSizeCount:
                                  storageBoxSizeProvider.largeBoxSizeText,
                              mediumBoxSizeCount:
                                  storageBoxSizeProvider.mediumBoxSizeText,
                              smallBoxSizeCount:
                                  storageBoxSizeProvider.smallBoxSizeText,
                              storageWeeks: storagePeriodProvider.weeksStored,
                              residenceName:
                                  storageCollectionProvider.residenceName,
                              roomNumber: storageCollectionProvider.roomNumber,
                              phoneNumber:
                                  storageCollectionProvider.mobileNumber,
                              addressType:
                                  storageCollectionProvider.addressType,
                              accessNote: storageCollectionProvider.accessNote,
                              locationName:
                                  storageReceiptProvider.locationAddress,
                              localPhoneNum: storageReceiptProvider.phoneNumber,
                              whatsPhoneNum:
                                  storageReceiptProvider.whatsAppNumber,
                              contactTimes: storageReceiptProvider.contactTimes,
                              momoFullName: momoUser.text,
                              momoPhoneNum: momoNum.text,
                              cost: _cost,
                            ));
                            print(await exes);
                          }),
                      CustomButton(
                          text: "No", onPressed: () => Navigator.pop(con))
                    ],
                  ),
                ],
              ));
    }
  }

  validate(String val, {bool isNumber = false}) {
    if (val == null || val == " ") {
      if (isNumber == true && _momoNum.text.length < 10) {
        return "The number is incomplete";
      } else {
        return "There is no username or value";
      }
    } else {
      return null;
    }
  }
}
