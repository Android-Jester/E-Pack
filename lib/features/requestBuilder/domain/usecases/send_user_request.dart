import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/UseCase/usecase.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:e_pack/features/requestBuilder/domain/repositories/user_request_repo.dart';
import 'package:equatable/equatable.dart';

class SendUserRequest extends UseCase<UserRequest, Params> {
  final UserRequestRepository? repo;

  SendUserRequest(this.repo);

  @override
  Future<Either<Failure, UserRequest>?>? call(Params params) async {
    return await repo!.sendUserRequest(
      params.firstName,
      params.lastName,
      params.emailAddress,
      params.timeDeposition,
      params.semesterPeriod,
      params.largeBoxSizeCount,
      params.mediumBoxSizeCount,
      params.smallBoxSizeCount,
      params.roomType,
      params.storageWeeks,
      params.residenceName,
      params.roomNumber,
      params.phoneNumber,
      params.addressType,
      params.accessNote,
      params.locationName,
      params.localPhoneNum,
      params.whatsPhoneNum,
      params.contactTimes,
      params.momoFullName,
      params.momoPhoneNum,
      params.cost,
    );
  }
}

// }
//
class Params extends Equatable {
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

  const Params({
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
