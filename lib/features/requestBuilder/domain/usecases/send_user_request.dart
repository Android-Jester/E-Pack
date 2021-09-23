import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/UseCase/usecase.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:e_pack/features/requestBuilder/domain/repositories/user_request_repo.dart';
import 'package:equatable/equatable.dart';

class SendUserRequest extends UseCase<UserRequest, Params> {
  final UserRequestRepository repo;

  SendUserRequest(this.repo);

  @override
  Future<Either<Failure, UserRequest>> call(Params params) async {
    return await repo.sendUserRequest(
        params.firstName,
        params.lastName,
        params.emailAddress,
        params.phoneNumber,
        params.largeBoxSizeCount,
        params.mediumBoxSizeCount,
        params.smallBoxSizeCount,
        params.locationName,
        params.apartmentName,
        params.roomNumber,
        params.address,
        params.cost);
  }
}

// }
//
class Params extends Equatable {
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

  Params({
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
