import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PersonalInfo extends Equatable{
  final String? firstName, lastName, locationName, phoneNumber;
  final TimeOfDay? availableTime;
  PersonalInfo({
    required this.firstName, required this.lastName,
    required this.locationName, required this.availableTime, required this.phoneNumber});

  @override
  // TODO: implement props
  List<Object?> get props => [firstName, lastName, locationName, availableTime, phoneNumber];
}