import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_model.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';
import 'package:e_pack/features/storage_option/domain/repositories/storage_request_repo.dart';

typedef StorageRequestModel _GetModelInstance();

class StorageRequestRepositoryImpl implements StorageRequestRepository {
  final StorageDataReceiver serverHost;
  final NetworkInfo networkInfo;

  StorageRequestRepositoryImpl(
      {required this.serverHost, required this.networkInfo});

  Future<Either<Failure, StorageRequest>?> _getResponse(
      _GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = responseModel();
        serverHost.sendStorageRequest(model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, StorageRequest>?>? sendStorageRequest(
    // Time of Collection
    String? timeCollect,
    String? semesterPeriod,

    // Room Type
    String? collectRoomType,

    // Box Sizes
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,

    //Period of Storage
    int? storageWeeks,

    // Collection Information
    String? residenceName,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,

    // Home Location and Contact Information
    String? locationName,
    String? localPhoneNum,
    String? whatsPhoneNum,
    int? contactTimes,

    // Payment Information
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  ) async {
    return await _getResponse(() => StorageRequestModel(
        timeCollect: timeCollect,
        semesterPeriod: semesterPeriod,
        collectRoomType: collectRoomType,
        storageWeeks: storageWeeks,
        residenceName: residenceName,
        roomNumber: roomNumber,
        phoneNumber: phoneNumber,
        addressType: addressType,
        accessNote: accessNote,
        locationName: locationName,
        localPhoneNum: localPhoneNum,
        whatsPhoneNum: whatsPhoneNum,
        contactTimes: contactTimes,
        momoFullName: momoFullName,
        momoPhoneNum: momoPhoneNum,
        cost: cost));
  }
}
