import 'package:equatable/equatable.dart';

class DeliveryRequest extends Equatable {
  final String? timeCollect, semesterPeriod, collectRoomType;
  final int? largeBoxSizeCount, mediumBoxSizeCount, smallBoxSizeCount;
  final int? relocateInfo;
  final String? residenceName;
  final int? roomNumber;
  final String? phoneNumber;
  final String? addressType;
  final String? accessNote;
  final String? destinationAddress;
  final int? destinationRoomNumber;
  final String? contactName, contactPhoneNum;
  final String? momoFullName, momoPhoneNum;
  final double? cost;

  DeliveryRequest({
    // Time Collection
    required this.timeCollect,
    required this.semesterPeriod,

    //Box Sizes
    this.largeBoxSizeCount,
    this.mediumBoxSizeCount,
    this.smallBoxSizeCount,

    //relocation Information
    required this.relocateInfo,

    // Collection Location Info
    required this.residenceName,
    required this.collectRoomType,
    required this.roomNumber,
    required this.phoneNumber,
    required this.addressType,
    required this.accessNote,

    // Destination Information
    required this.destinationAddress,
    required this.destinationRoomNumber,
    required this.contactName,
    required this.contactPhoneNum,

    //Payment Details
    required this.momoFullName,
    required this.momoPhoneNum,
    required this.cost,
  });

  @override
  List<Object?> get props => [
        // Time Collection
        timeCollect,
        semesterPeriod,

        //Box Sizes
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,

        //relocation Information
        relocateInfo,

        // Collection Location Info
        residenceName,
        collectRoomType,
        roomNumber,
        phoneNumber,
        addressType,
        accessNote,

        // Destination Information
        destinationAddress,
        destinationRoomNumber,
        contactName,
        contactPhoneNum,

        //Payment Details
        momoFullName,
        momoPhoneNum,
        cost,
      ];
}
