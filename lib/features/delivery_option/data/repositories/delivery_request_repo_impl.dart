import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:e_pack/features/delivery_option/domain/repositories/delivery_request_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef Future<DeliveryRequest> _GetModelInstance();

class DeliveryRequestRepositoryImpl implements DeliveryRequestRepository {
  final DeliveryDataReciever serverHost;
  NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker());

  DeliveryRequestRepositoryImpl({required this.serverHost});

  Future<Either<Failure, DeliveryRequest>>? _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await responseModel();
        await serverHost.sendDeliveryRequest(
            timeCollect: model.timeCollect,
            semesterPeriod: model.semesterPeriod,
            relocateInfo: model.relocateInfo,
            residenceName: model.residenceName,
            collectRoomType: model.collectRoomType,
            roomNumber: model.roomNumber,
            phoneNumber: model.phoneNumber,
            addressType: model.addressType,
            accessNote: model.accessNote,
            destinationAddress: model.destinationAddress,
            destinationRoomNumber: model.destinationRoomNumber,
            contactName: model.contactName,
            contactPhoneNum: model.contactPhoneNum,
            momoFullName: model.momoFullName,
            momoPhoneNum: model.momoPhoneNum,
            smallBoxSizeCount: model.smallBoxSizeCount,
            mediumBoxSizeCount: model.mediumBoxSizeCount,
            largeBoxSizeCount: model.largeBoxSizeCount,
            cost: model.cost);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, DeliveryRequest>?>? sendDeliveryRequest({
    required String? timeCollect,
    required String? semesterPeriod,
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
    return await _getResponse(() async => DeliveryRequest(
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
        smallBoxSizeCount: smallBoxSizeCount,
        mediumBoxSizeCount: mediumBoxSizeCount,
        largeBoxSizeCount: largeBoxSizeCount,
        cost: cost));
  }
}
