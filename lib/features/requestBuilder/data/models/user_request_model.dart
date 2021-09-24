import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';

class UserRequestModel extends UserRequest {
  UserRequestModel(
      {required String? firstName,
      required String? lastName,
      required String? emailAddress,
      required String? phoneNumber,
      required int? largeBoxSizeCount,
      required int? mediumBoxSizeCount,
      required int? smallBoxSizeCount,
      required String? locationName,
      required String? apartmentName,
      required int? roomNumber,
      required String? address,
      required double? cost})
      : super(
            firstName: firstName,
            lastName: lastName,
            emailAddress: emailAddress,
            phoneNumber: phoneNumber,
            largeBoxSizeCount: largeBoxSizeCount,
            mediumBoxSizeCount: mediumBoxSizeCount,
            smallBoxSizeCount: smallBoxSizeCount,
            locationName: locationName,
            apartmentName: apartmentName,
            roomNumber: roomNumber,
            address: address,
            cost: cost);

  factory UserRequestModel.fromJson(Map<String, dynamic> json) {
    return UserRequestModel(
        firstName: json['firstName'],
        lastName: json['lastName'],
        emailAddress: json['emailAddress'],
        phoneNumber: json['phoneNumber'],
        largeBoxSizeCount: (json['largeBoxSizeCount'] as num).toInt(),
        mediumBoxSizeCount: (json['mediumBoxSizeCount'] as num).toInt(),
        smallBoxSizeCount: (json['smallBoxSizeCount'] as num).toInt(),
        locationName: json['locationName'],
        apartmentName: json['apartmentName'],
        roomNumber: (json['roomNumber'] as num).toInt(),
        address: json['address'],
        cost: (json['cost'] as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName: ": firstName,
      "lastName": lastName,
      "emailAddress": emailAddress,
      "phoneNumber": phoneNumber,
      "largeBoxSizeCount": largeBoxSizeCount ?? 0,
      "mediumBoxSizeCount": mediumBoxSizeCount ?? 0,
      "smallBoxSizeCount": smallBoxSizeCount ?? 0,
      "locationName": locationName,
      "apartmentName": apartmentName,
      "roomNumber": roomNumber,
      "address": address,
      "cost": cost
    };
  }
}
