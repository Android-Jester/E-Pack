import 'package:dartz/dartz.dart';
import 'package:e_pack/core/error/failures.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';

//creates a contract of the information that would be sent to the server when packing
abstract class UserRequestRepository {
  Future<Either<Failure, UserRequest>> sendUserRequestInfo(
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

  receiveUserIDNumber({required int number});
}
