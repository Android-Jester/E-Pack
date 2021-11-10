import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:flutter/material.dart';

class DeliveryRequestModel extends DeliveryRequest {
  DeliveryRequestModel(
      { 
      required String? timeCollect,
      required String? semesterPeriod,
      int? largeBoxSizeCount,
      int? mediumBoxSizeCount,
      int? smallBoxSizeCount,
      required int? relocateInfo,
      required String? residenceName,
      required String? collectRoomType,
      required int? roomNumber,
      required String? phoneNumber,
      required String? addressType,
      required String? accessNote,
      required String? destinationAddress,
      required int? destinationRoomNumber,
      required String? contactName,
      required String? contactPhoneNum,
      required String? momoFullName,
      required String? momoPhoneNum,
      required double? cost})
      : super(
          timeCollect: timeCollect,
          semesterPeriod: semesterPeriod,
          largeBoxSizeCount: largeBoxSizeCount,
          mediumBoxSizeCount: mediumBoxSizeCount,
          smallBoxSizeCount: smallBoxSizeCount,
          relocateInfo: relocateInfo,
          residenceName: residenceName,
          collectRoomType: collectRoomType,
          roomNumber: roomNumber,
          phoneNumber: phoneNumber,
          addressType: addressType,
          accessNote: accessNote,
          destinationAddress: destinationAddress,
          destinationRoomNumber: destinationRoomNumber,
          contactName: contactName,
          contactPhoneNum: contactPhoneNum,
          momoFullName: momoFullName,
          momoPhoneNum: momoPhoneNum,
          cost: cost,
        );

  factory DeliveryRequestModel.fromJson(Map<String, dynamic> json) {
    return DeliveryRequestModel(
      timeCollect: json['timeCollect'],
      semesterPeriod: json['semPeriod'],
      largeBoxSizeCount: (json['largeBoxSize'] as num).toInt(),
      mediumBoxSizeCount: (json['mediumBoxSize'] as num).toInt(),
      smallBoxSizeCount: (json['smallBoxSize'] as num).toInt(),
      relocateInfo: json['relocateInfo'],
      residenceName: json['residenceName'],
      collectRoomType: json['roomType'],
      roomNumber: (json['roomNum'] as num).toInt(),
      phoneNumber: json['phoneNum'],
      addressType: json['addressType'],
      accessNote: json['note'],
      destinationAddress: json['destinationAddress'],
      destinationRoomNumber: (json['destinationRoomNumber'] as num).toInt(),
      contactName: json['contactName'],
      contactPhoneNum: json['contactPhoneNum'],
      momoFullName: json['momoFullName'],
      momoPhoneNum: json["momoNum"],
      cost: json["cost"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // Time Collection
      "timeCollect": timeCollect,
      "semPeriod": semesterPeriod,

      // Box Sizes
      "largeBoxSize": (largeBoxSizeCount as num),
      "mediumBoxSize": (mediumBoxSizeCount as num),
      "smallBoxSize": (smallBoxSizeCount as num),

      // Relocation Info
      "relocateInfo": relocateInfo,

      // Collection Location Info
      "residenceName": residenceName,
      "roomType": collectRoomType,
      "roomNum": roomNumber,
      "phoneNum": phoneNumber,
      "addressType": addressType,
      "note": accessNote,

      // Destination Info
      "destinationAddress": destinationAddress,
      "destinationRoomNumber": destinationRoomNumber,
      "contactName": contactName,
      "contactPhoneNum": contactPhoneNum,

      // Payment Info
      "momoFullName": momoFullName,
      "momoNum": momoPhoneNum,
      "cost": cost,
    };
  }
}
