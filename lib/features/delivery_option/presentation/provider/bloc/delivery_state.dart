import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/presentation/widgets/finalize.dart';
import 'package:e_pack/core/presentation/widgets/state_dialogs.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/mobile_money_payment_info.dart';
import 'package:e_pack/injector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../box_size_data.dart';
import '../collection_info.dart';
import '../delivery_recepient_info.dart';
import '../relocation_details_info.dart';
import '../time_info_notifier.dart';
import 'state_forms.dart';

class DeliveryFinal extends ChangeNotifier {
  final BuildContext context;

  // Dependency
  late Dependency inject = Provider.of<Dependency>(context);

  // Usecase
  late SendDeliveryRequest request = SendDeliveryRequest(repo: inject.repositoryImpl);

  // Failure Message
  static const String SERVER_FAILURE_MESSAGE = 'Server Failure';

  DeliveryFinal({
    required this.context,
  });

  Stream<DeliveryState> repoStream({required Either<Failure, DeliveryRequest> usecase}) async* {
    yield LoadingState();
    yield usecase.fold(
      (fail) => ErrorState(SERVER_FAILURE_MESSAGE),
      (result) => LoadedState(result),
    );
  }

  sendRequest(BuildContext con, PageController controller, int currentPage) async {
    // Gets the dependency of each area
    var boxSizes = Provider.of<BoxSizeData>(con, listen: false);
    var timeInfo = Provider.of<TimeInfo>(con, listen: false);
    var relocate = Provider.of<RelocationDetailsInfo>(con, listen: false);
    var collection = Provider.of<CollectionInfo>(con, listen: false);
    var finalInfo = Provider.of<DeliveryRecepientInfo>(con, listen: false);
    var payment = Provider.of<MomoInformationProvider>(con, listen: false);

    // Calculate the Cost
    double _cost = (boxSizes.largeBoxSizeText * 5) + (boxSizes.mediumBoxSizeText * 2) + (boxSizes.smallBoxSizeText * 1.5);

    // Sets the value of the parameter
    Params params = Params(
      timeCollect: timeInfo.dateTimeVal!,
      largeBoxSizeCount: boxSizes.largeBoxSizeText,
      mediumBoxSizeCount: boxSizes.mediumBoxSizeText,
      smallBoxSizeCount: boxSizes.smallBoxSizeText,
      relocateInfo: relocate.relocationValue,
      residenceName: collection.residenceName,
      roomNumber: collection.roomNumber,
      phoneNumber: collection.mobileNumber,
      addressType: collection.addressType,
      accessNote: collection.accessNote,
      destinationAddress: finalInfo.destinationAddress,
      destinationRoomNumber: finalInfo.roomNumber,
      contactName: finalInfo.contactName,
      contactPhoneNum: finalInfo.contactNumber,
      momoPhoneNum: payment.momoNum.text,
      momoFullName: payment.momoUser.text,
      cost: _cost,
      collectRoomType: collection.roomNumber,
    );

    return StreamBuilder(
        stream: repoStream(usecase: await request(params: params)),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Finalize(
              dateTimeVal: Provider.of<TimeInfo>(con, listen: false).dateTimeVal!,
            ).builder(context);
          } else if (snapshot.hasError) {
            return ErrorDialog(retry: () {
              Navigator.pop(context);
              sendRequest(con, controller, currentPage);
            }, dispose: () {
              Navigator.pop(context);
            }).builder(context);
          } else {
            return const LoadingDialog().builder(context);
          }
        });
  }
}
