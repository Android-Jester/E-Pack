import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/storage_option/data/datasources/server_host.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';
import 'package:e_pack/features/storage_option/domain/repositories/storage_request_repo.dart';

class StorageRequestRepositoryImpl implements StorageRequestRepository {
  final ServerHost serverHost;
  final NetworkInfo networkInfo;

  StorageRequestRepositoryImpl(
      {required this.serverHost, required this.networkInfo});

  @override
  StorageRequest get request => throw UnimplementedError();

  @override
  Future<Either<Failure, StorageRequest>>? sendStorageRequest(
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
    networkInfo.isConnected;
    try {
      final remoteTrivia = await serverHost.sendStorageRequest(
        // Time of Collection
        timeCollect,
        semesterPeriod,

        // Room Type
        collectRoomType,

        // Box Sizes
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,

        //Period of Storage
        storageWeeks,

        // Collection Information
        residenceName,
        roomNumber,
        phoneNumber,
        addressType,
        accessNote,

        // Home Location and Contact Information
        locationName,
        localPhoneNum,
        whatsPhoneNum,
        contactTimes,

        // Payment Information
        momoFullName,
        momoPhoneNum,
        cost,
      );
      return Right(remoteTrivia!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
