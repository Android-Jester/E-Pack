import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/UseCase/usecase.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';
import 'package:e_pack/features/storage_option/domain/repositories/storage_request_repo.dart';
import 'package:equatable/equatable.dart';

class SendStorageRequest extends UseCase<StorageRequest, Params> {
  final StorageRequestRepository repo;

  SendStorageRequest(this.repo);

  @override
  Future<Either<Failure, StorageRequest>?> call(Params params) async {
    return await repo.sendStorageRequest(
      // Time of Collection
      timeCollect: params.timeCollect,
      semesterPeriod: params.semesterPeriod,

      //Room Type
      collectRoomType: params.collectRoomType,

      //Box Sizes
      largeBoxSizeCount: params.largeBoxSizeCount,
      mediumBoxSizeCount: params.mediumBoxSizeCount,
      smallBoxSizeCount: params.smallBoxSizeCount,

      //Period of Storage
      storageWeeks: params.storageWeeks,

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
  final String timeCollect, semesterPeriod, collectRoomType;
  final int largeBoxSizeCount, mediumBoxSizeCount, smallBoxSizeCount;
  final int storageWeeks;
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
    required this.semesterPeriod,

    //Room Type
    required this.collectRoomType,

    //Box Sizes
    this.largeBoxSizeCount = 0,
    this.mediumBoxSizeCount = 0,
    this.smallBoxSizeCount = 0,

    //Period of Storage
    required this.storageWeeks,

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
        semesterPeriod,

        //Room Type
        collectRoomType,

        //Box Sizes
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,

        //Period of Storage
        storageWeeks,

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
