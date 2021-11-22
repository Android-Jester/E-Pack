import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';

class StorageRequestModel extends StorageRequest {
  StorageRequestModel({
    required String timeCollect,
    required String semesterPeriod,
    required String collectRoomType,
    int largeBoxSizeCount = 0,
    int mediumBoxSizeCount = 0,
    int smallBoxSizeCount = 0,
    required int storageWeeks,
    required String residenceName,
    required String roomNumber,
    required String phoneNumber,
    required String addressType,
    required String accessNote,
    required String locationName,
    required String localPhoneNum,
    required String whatsPhoneNum,
    required String contactTimes,
    required String momoFullName,
    required String momoPhoneNum,
    required double cost,
  }) : super(
// time collection
          timeCollect: timeCollect,
          semesterPeriod: semesterPeriod,

          collectRoomType: collectRoomType,

          largeBoxSizeCount: largeBoxSizeCount,
          mediumBoxSizeCount: mediumBoxSizeCount,
          smallBoxSizeCount: smallBoxSizeCount,

          storageWeeks: storageWeeks,

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
        );

  // factory StorageRequestModel.fromJson(Map<String, dynamic> json) {
  //   return StorageRequestModel(
  //     timeCollect: json["timeCollect"],
  //     semesterPeriod: json["semesterPeriod"],
  //     collectRoomType: json["collectRoomType"],
  //     largeBoxSizeCount: json["largeBoxSizeCount"],
  //     mediumBoxSizeCount: json["mediumBoxSizeCount"],
  //     smallBoxSizeCount: json["smallBoxSizeCount"],
  //     storageWeeks: json["storageWeeks"],
  //     residenceName: json["residenceName"],
  //     roomNumber: json["roomNumber"],
  //     phoneNumber: json["phoneNumber"],
  //     addressType: json["addressType"],
  //     accessNote: json["accessNote"],
  //     locationName: json["locationName"],
  //     localPhoneNum: json["localPhoneNum"],
  //     whatsPhoneNum: json["whatsPhoneNum"],
  //     contactTimes: json["contactTimes"],
  //     momoFullName: json["momoFullName"],
  //     momoPhoneNum: json["momoPhoneNum"],
  //     cost: json["cost"],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "timeCollect": timeCollect,
      "semesterPeriod": semesterPeriod,
      "collectRoomType": collectRoomType,
      "largeBoxSizeCount": largeBoxSizeCount,
      "mediumBoxSizeCount": mediumBoxSizeCount,
      "smallBoxSizeCount": smallBoxSizeCount,
      "storageWeeks": storageWeeks,
      "residenceName": residenceName,
      "roomNumber": roomNumber,
      "phoneNumber": phoneNumber,
      "addressType": addressType,
      "accessNote": accessNote,
      "locationName": locationName,
      "localPhoneNum": localPhoneNum,
      "whatsPhoneNum": whatsPhoneNum,
      "contactTimes": contactTimes,
      "momoFullName": momoFullName,
      "momoPhoneNum": momoPhoneNum,
      "cost": cost,
    };
  }
}
