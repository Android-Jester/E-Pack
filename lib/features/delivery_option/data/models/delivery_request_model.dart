import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';

class DeliveryRequestModel extends DeliveryRequest {
  DeliveryRequestModel(
      {required String? timeCollect,
      required String? semesterPeriod,
      int? largeBoxSizeCount,
      int? mediumBoxSizeCount,
      int? smallBoxSizeCount,
      required int? relocateInfo,
      required String? residenceName,
      required String? collectRoomType,
      required String? roomNumber,
      required String? phoneNumber,
      required String? addressType,
      required String? accessNote,
      required String? destinationAddress,
      required String? destinationRoomNumber,
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

  Map<String, dynamic> toJson() {
    return {
      // Time Collection
      "timeCollect": timeCollect,
      "semPeriod": semesterPeriod,

      // Box Sizes
      "largeBoxSizeCount": (largeBoxSizeCount as num),
      "mediumBoxSizeCount": (mediumBoxSizeCount as num),
      "smallBoxSizeCount": (smallBoxSizeCount as num),

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
