import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:e_pack/features/delivery_option/domain/repositories/delivery_request_repo.dart';

import '../../domain/entities/response.dart';

typedef Future<DeliveryResponse> _GetModelInstance();

class DeliveryRequestRepositoryImpl implements DeliveryRequestRepository {
  final DeliveryDataReciever serverHost;
  final NetworkInfo networkInfo;
  @override final String username;

  DeliveryRequestRepositoryImpl({
    required this.networkInfo,
    required this.serverHost,
    required this.username,
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
}
