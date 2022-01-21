import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';

abstract class StorageRequestRepository {
  Future<Either<Failure, StorageRequest>> sendStorageRequest({
    // Time of Collection
    required String timeCollect,

    // Room Type
    required String collectRoomType,

    // Box Sizes
    required int largeBoxSizeCount,
    required int mediumBoxSizeCount,
    required int smallBoxSizeCount,

    //Period of Storage

    // Collection Information
    required String residenceName,
    required String roomNumber,
    required String phoneNumber,
    required String addressType,
    required String accessNote,

    // Home Location and Contact Information
    required String locationName,
    required String localPhoneNum,
    required String whatsPhoneNum,
    required String contactTimes,

    // Payment Information
    required String momoFullName,
    required String momoPhoneNum,
    required double cost,
  });
}
