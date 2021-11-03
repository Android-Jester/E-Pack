import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:e_pack/features/delivery_option/domain/repositories/delivery_request_repo.dart';

typedef DeliveryRequestModel _GetModelInstance();

class DeliveryRequestRepositoryImpl implements DeliveryRequestRepository {
  final DeliveryDataReciever serverHost;
  final NetworkInfo networkInfo;

  DeliveryRequestRepositoryImpl(
      {required this.serverHost, required this.networkInfo});

  Future<Either<Failure, DeliveryRequest>?> _getResponse(
      _GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = responseModel();
        serverHost.sendDeliveryRequest(model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, DeliveryRequest>?>? sendDeliveryRequest(
      String? timeCollect,
      String? semesterPeriod,
      int? largeBoxSizeCount,
      int? mediumBoxSizeCount,
      int? smallBoxSizeCount,
      int? relocateInfo,
      String? residenceName,
      String? collectRoomType,
      int? roomNumber,
      String? phoneNumber,
      String? addressType,
      String? accessNote,
      String? destinationAddress,
      int? destinationRoomNumber,
      String? contactName,
      String? contactPhoneNum,
      String? momoFullName,
      String? momoPhoneNum,
      double? cost) async {
    return await _getResponse(() => DeliveryRequestModel(
        timeCollect: timeCollect,
        semesterPeriod: semesterPeriod,
        relocateInfo: relocateInfo,
        residenceName: residenceName,
        collectRoomType: collectRoomType,
        roomNumber: roomNumber,
        phoneNumber: phoneNumber,
        addressType: addressType,
        accessNote: accessNote,
        destinationAddress: destinationAddress,
        destinationRoomNumber: destinationRoomNumber,
        contactName: contactName,
        contactPhoneNum: contactPhoneNum,
        momoFullName: momoFullName,
        momoPhoneNum: momoPhoneNum,
        cost: cost));
  }
}
