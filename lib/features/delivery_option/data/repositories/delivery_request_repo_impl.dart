import 'package:dartz/dartz.dart';

import '../../../../core/core_errors/exceptions.dart';
import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/network.dart';
import '../../domain/entities/response.dart';
import '../../domain/repositories/delivery_request_repo.dart';
import '../datasources/delivery_data_reciever.dart';
import '../models/delivery_request_model.dart';

typedef Future<DeliveryResponse> _GetModelInstance();

class DeliveryRequestRepositoryImpl implements DeliveryRequestRepository {
  final DeliveryDataReciever serverHost;
  final NetworkInfo networkInfo;

  DeliveryRequestRepositoryImpl({
    required this.networkInfo,
    required this.serverHost,
  });

  Future<Either<Failure, DeliveryResponse>> _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await responseModel();
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DeliveryResponse>> sendDeliveryRequest({
    required String? timeCollect,
    required int? largeBoxSizeCount,
    required int? mediumBoxSizeCount,
    required int? smallBoxSizeCount,
    required int? relocateInfo,
    required String? residenceName,
    required String? collectRoomType,
    required String? roomNumber,
    required String? phoneNumber,
    required String? addressType,
    String? accessNote,
    String? destinationAddress,
    String? destinationRoomNumber,
    String? contactName,
    String? contactPhoneNum,
    required String? momoFullName,
    required String? momoPhoneNum,
    required double? cost,
  }) async {
    return await _getResponse(() async => serverHost.sendDeliveryRequest(model: DeliveryRequestModel(
        timeCollect: timeCollect,
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
        smallBoxSizeCount: smallBoxSizeCount,
        mediumBoxSizeCount: mediumBoxSizeCount,
        largeBoxSizeCount: largeBoxSizeCount,
        cost: cost)));
  }

  @override
  String username = '';
}
