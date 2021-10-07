import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';

abstract class UserRequestRepository {
  final UserRequest request;
  UserRequestRepository({required this.request});

  Future<Either<Failure, UserRequest>>? sendUserRequest(
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? timeDeposition,
    String? semesterPeriod,
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,
    String? roomType,
    int? storageWeeks,
    String? residenceName,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,
    String? locationName,
    String? localPhoneNum,
    String? whatsPhoneNum,
    int? contactTimes,
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  );
}
