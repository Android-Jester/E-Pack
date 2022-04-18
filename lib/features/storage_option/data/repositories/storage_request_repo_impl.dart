import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../../../core/core_errors/exceptions.dart';
import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/network.dart';
import '../../domain/entities/storage_response_request.dart';
import '../../domain/repositories/storage_request_repo.dart';
import '../datasources/storage_data_receiver.dart';
import '../models/storage_request_model.dart';

typedef Future<StorageRequestResponse> _GetModelInstance();

class StorageRequestRepositoryImpl implements StorageRequestRepository {
  final StorageDataReceiver serverHost;
  late NetworkInfo networkInfo;
  String username = "";

  StorageRequestRepositoryImpl({required this.serverHost}) {
    networkInfo = NetworkInfoImpl(InternetConnectionChecker());
  }

  Future<Either<Failure, StorageRequestResponse>> _getResponse(_GetModelInstance responseModel) async {
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
  Future<Either<Failure, StorageRequestResponse>> sendStorageRequest({
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
  }) async =>
      _getResponse(
        () async => serverHost.sendStorageRequest(
          model: StorageRequestModel(
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
            cost: cost,
          ),
          username: username,
        ),
      );
}
