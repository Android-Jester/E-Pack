import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';
import 'package:e_pack/features/storage_option/domain/repositories/storage_request_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef Future<StorageRequest> _GetModelInstance();

class StorageRequestRepositoryImpl implements StorageRequestRepository {
  final StorageDataReceiver serverHost;
  late NetworkInfo networkInfo;

  StorageRequestRepositoryImpl({required this.serverHost}) {
    networkInfo = NetworkInfoImpl(InternetConnectionChecker());
  }

  Future<Either<Failure, StorageRequest>?> _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await responseModel();
        print("repository started");
        serverHost.sendStorageRequest(
          timeCollect: model.timeCollect,
          collectRoomType: model.collectRoomType,
          residenceName: model.residenceName,
          roomNumber: model.roomNumber,
          phoneNumber: model.phoneNumber,
          addressType: model.addressType,
          accessNote: model.accessNote,
          locationName: model.locationName,
          localPhoneNum: model.localPhoneNum,
          whatsPhoneNum: model.whatsPhoneNum,
          contactTimes: model.contactTimes,
          momoFullName: model.momoFullName,
          momoPhoneNum: model.momoPhoneNum,
          cost: model.cost,
          smallBoxSizeCount: model.smallBoxSizeCount,
          mediumBoxSizeCount: model.mediumBoxSizeCount,
          largeBoxSizeCount: model.largeBoxSizeCount,
        );
        return Right(model);
      } on ServerException {
        print("Server Failure due to no data result");
        return Left(ServerFailure());
      }
    } else {
      print("Server Failure due to no data");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StorageRequest>?>? sendStorageRequest({
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
  }) async {
    return await _getResponse(() async => StorageRequest(
        timeCollect: timeCollect,
        collectRoomType: collectRoomType,
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
        smallBoxSizeCount: smallBoxSizeCount,
        mediumBoxSizeCount: mediumBoxSizeCount,
        largeBoxSizeCount: largeBoxSizeCount,
        cost: cost));
  }
}
