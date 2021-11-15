import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';

abstract class StorageRequestRepository {
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
  );
}
