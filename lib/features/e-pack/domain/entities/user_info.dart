import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class UserAccount extends Equatable{

  final String userName, firstName, lastName, emailAddress, passcode;
  UserAccount({required this.firstName,required this.lastName,required  this.emailAddress,  required this.passcode, required this.userName,});

  @override
  List<Object?> get props => [userName, firstName, lastName, emailAddress, passcode];
}

class BoxCount extends Equatable{
  final int largeSize, mediumSize, smallSize;

  BoxCount({required this.largeSize,required this.mediumSize, required  this.smallSize});

  @override
  // TODO: implement props
  List<Object?> get props => [largeSize, mediumSize, smallSize];
}

class PersonalInfo extends Equatable{
  final String locationName;
  final TimeOfDay availableTime;
  final int phoneNumber;
  PersonalInfo({required this.locationName, required this.availableTime, required this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [locationName, availableTime, phoneNumber];
}

class DeliveryInfo extends Equatable{
  final String apartmentName;
  final int roomNumber;
  final String address, contactName;

  DeliveryInfo(this.apartmentName, this.roomNumber, this.address, this.contactName);

  @override
  // TODO: implement props
  List<Object?> get props => [apartmentName, roomNumber, address, contactName];
}