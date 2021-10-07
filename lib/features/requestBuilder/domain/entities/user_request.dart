import 'package:equatable/equatable.dart';

class UserRequest extends Equatable {
  final String? firstName, lastName;
  final String? emailAddress;
  final String? timeDeposition, semesterPeriod;
  final int? largeBoxSizeCount, mediumBoxSizeCount, smallBoxSizeCount;
  final String? roomType;
  final int? storageWeeks;
  final String? residenceName;
  final int? roomNumber;
  final String? phoneNumber;
  final String? addressType;
  final String? accessNote;
  final String? locationName;
  final String? localPhoneNum, whatsPhoneNum;
  final int? contactTimes;
  final String? momoFullName, momoPhoneNum;
  final double? cost;

  UserRequest({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.timeDeposition,
    required this.semesterPeriod,
    this.largeBoxSizeCount,
    this.mediumBoxSizeCount,
    this.smallBoxSizeCount,
    required this.roomType,
    required this.storageWeeks,
    required this.residenceName,
    required this.roomNumber,
    required this.phoneNumber,
    required this.addressType,
    required this.accessNote,
    required this.locationName,
    required this.localPhoneNum,
    required this.whatsPhoneNum,
    required this.contactTimes,
    required this.momoFullName,
    required this.momoPhoneNum,
    required this.cost,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        emailAddress,
        timeDeposition,
        semesterPeriod,
        roomType,
        storageWeeks,
        residenceName,
        phoneNumber,
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,
        locationName,
        residenceName,
        localPhoneNum,
        whatsPhoneNum,
        accessNote,
        roomNumber,
        addressType,
        contactTimes,
        momoFullName,
        momoPhoneNum,
        cost,
      ];
}
