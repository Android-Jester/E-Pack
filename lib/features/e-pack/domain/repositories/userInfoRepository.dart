import 'package:dartz/dartz.dart';
import 'package:e_pack/core/error/failures.dart';
import 'package:e_pack/features/e-pack/domain/entities/user_info.dart';

//creates a contract of the information that would be sent to the server when packing
abstract class UserRequestRepository {
  Future<Either<Failure, UserAccount>> sendUserRequestInfo(
      {required String firstName,
      required String lastName,
      required String emailAddress,
      required String phoneNumber,
      required int largeBoxSizeCount,
      required int mediumBoxSizeCount,
      required int smallBoxSizeCount,
      required String locationName,
      required String apartmentName,
      required int roomNumber,
      required String address,
      required double cost});

  receiveUserIDNumber({required int number});
}
