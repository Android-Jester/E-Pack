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
    String? phoneNumber,
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,
    String? locationName,
    String? apartmentName,
    int? roomNumber,
    String? address,
    double? cost,
  );
}
