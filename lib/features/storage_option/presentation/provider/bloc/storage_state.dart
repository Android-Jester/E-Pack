import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/presentation/widgets/finalize.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';
import 'package:e_pack/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:e_pack/injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../box_size_data.dart';
import '../collection_info.dart';
import '../mobile_money_payment_info.dart';
import '../room_type_data.dart';
import '../storage_recepient_info.dart';
import '../time_info_notifier.dart';
import 'state_forms.dart';

class StorageState extends ChangeNotifier {
  final BuildContext context;

  // Dependency
  late Dependency inject = Provider.of<Dependency>(context);

  // Usecase
  late SendStorageRequest request = SendStorageRequest(inject.storageRepo);

  // Failure Message
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';

  StorageState({
    required this.context,
  });

  Stream<DeliveryState> repoStream({required Either<Failure, StorageRequest> usecase}) async* {
    yield LoadingState();
    yield usecase.fold(
      (fail) => ErrorState(SERVER_FAILURE_MESSAGE),
      (result) => LoadedState(result),
    );
  }

  sendRequest() async {
    var timeInfo = Provider.of<StorageTimeInfo>(context, listen: false);
    var boxSizes = Provider.of<StorageBoxSizeData>(context, listen: false);
    var collection = Provider.of<StorageCollectionData>(context, listen: false);
    var finalInfo = Provider.of<StorageRecepientInfo>(context, listen: false);
    var roomType = Provider.of<StorageRoomTypeData>(context, listen: false);
    var payment = Provider.of<StorageMomoPaymentInfo>(context, listen: false);

    double _cost = (boxSizes.largeBoxSizeText * 5) + (boxSizes.mediumBoxSizeText * 2) + (boxSizes.smallBoxSizeText * 1.5);

    Params params = Params(
        timeCollect: timeInfo.dateTimeVal,
        largeBoxSizeCount: boxSizes.largeBoxSizeText,
        mediumBoxSizeCount: boxSizes.mediumBoxSizeText,
        smallBoxSizeCount: boxSizes.smallBoxSizeText,
        residenceName: collection.residenceName,
        roomNumber: collection.roomNumber,
        phoneNumber: collection.mobileNumber,
        addressType: collection.addressType,
        accessNote: collection.accessNote,
        locationName: finalInfo.locationAddress,
        contactTimes: finalInfo.contactTimes,
        localPhoneNum: finalInfo.phoneNumber,
        whatsPhoneNum: finalInfo.whatsAppNumber,
        momoPhoneNum: payment.momoNum.text,
        momoFullName: payment.momoUser.text,
        cost: _cost,
        collectRoomType: roomType.roomType.toString());

    StreamBuilder(
        stream: repoStream(usecase: await request(params: params)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Finalize(
              dateTimeVal: Provider.of<StorageTimeInfo>(context, listen: false).dateTimeVal,
            ).builder(context);
          } else if (snapshot.hasError) {
            return ErrorDialog(
                retry: () {
                  Navigator.pop(context);
                  sendRequest();
                },
                dispose: () => Navigator.pop(context)).builder(context);
          } else {
            return LoadingDialog().build(context);
          }
        });
  }
}
