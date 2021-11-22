import 'package:equatable/equatable.dart';

class StorageRequest extends Equatable {
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

  const StorageRequest({
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
