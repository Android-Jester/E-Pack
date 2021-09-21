import 'package:equatable/equatable.dart';

class UserRequest extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? emailAddress;
  final String? phoneNumber;
  final int? largeBoxSizeCount;
  final int? mediumBoxSizeCount;
  final int? smallBoxSizeCount;
  final String? locationName;
  final String? apartmentName;
  final int? roomNumber;
  final String? address;
  final double? cost;

  UserRequest({
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.phoneNumber,
    this.largeBoxSizeCount,
    this.mediumBoxSizeCount,
    this.smallBoxSizeCount,
    required this.locationName,
    required this.apartmentName,
    required this.roomNumber,
    required this.address,
    required this.cost,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        firstName,
        lastName,
        emailAddress,
        phoneNumber,
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,
        locationName,
        apartmentName,
        roomNumber,
        address,
        cost,
      ];
}