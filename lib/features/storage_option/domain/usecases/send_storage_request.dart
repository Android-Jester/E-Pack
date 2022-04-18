import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/classes/usecase.dart';
import '../entities/storage_response_request.dart';
import '../repositories/storage_request_repo.dart';

class SendStorageRequest extends UseCase<StorageRequestResponse, Params> {
  final StorageRequestRepository repo;

  SendStorageRequest(this.repo);

  @override
  Future<Either<Failure, StorageRequestResponse>> call({required Params params}) async {
    return repo.sendStorageRequest(
      // Time of Collection
      timeCollect: params.timeCollect,

      //Room Type
      collectRoomType: params.collectRoomType,

      //Box Sizes
      largeBoxSizeCount: params.largeBoxSizeCount,
      mediumBoxSizeCount: params.mediumBoxSizeCount,
      smallBoxSizeCount: params.smallBoxSizeCount,

      //Period of Storage

      //Collection Information
      residenceName: params.residenceName,
      roomNumber: params.roomNumber,
      phoneNumber: params.phoneNumber,
      addressType: params.addressType,
      accessNote: params.accessNote,

      // Home Location and Contact Information
      locationName: params.locationName,
      localPhoneNum: params.localPhoneNum,
      whatsPhoneNum: params.whatsPhoneNum,
      contactTimes: params.contactTimes,

      // Payment Information
      momoFullName: params.momoFullName,
      momoPhoneNum: params.momoPhoneNum,
      cost: params.cost,
    );
  }
}

class Params extends Equatable {
  // Time of Collection
  final String timeCollect, collectRoomType;
  final int largeBoxSizeCount, mediumBoxSizeCount, smallBoxSizeCount;
  final String residenceName;
  final String roomNumber;
  final String phoneNumber;
  final String addressType;
  final String accessNote;
  final String locationName;
  final String localPhoneNum, whatsPhoneNum;
  final String contactTimes;
  final String momoFullName, momoPhoneNum;
  final double cost;

  const Params({
    // Time of Collection
    required this.timeCollect,

    //Room Type
    required this.collectRoomType,

    //Box Sizes
    this.largeBoxSizeCount = 0,
    this.mediumBoxSizeCount = 0,
    this.smallBoxSizeCount = 0,

    //Period of Storage

    //Collection Information
    required this.residenceName,
    required this.roomNumber,
    required this.phoneNumber,
    required this.addressType,
    required this.accessNote,

    // Home Location and Contact Information
    required this.locationName,
    required this.localPhoneNum,
    required this.whatsPhoneNum,
    required this.contactTimes,

    // Payment Information
    required this.momoFullName,
    required this.momoPhoneNum,
    required this.cost,
  });

  @override
  List<Object?> get props => [
        // Time of Collection
        timeCollect,

        //Room Type
        collectRoomType,

        //Box Sizes
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,

        //Period of Storage

        //Collection Information
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
      ];
}
