import 'package:e_pack/core/error/failures.dart';
import 'package:e_pack/core/usecases/usecase.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';
import 'package:e_pack/features/e-pack/domain/repositories/userInfoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetUserRequestInfo extends UseCase<UserRequest, Params> {
  final UserRequestRepository repo;

  GetUserRequestInfo({required this.repo});

  @override
  Future<Either<Failure, UserRequest>> call(Params? params) async {
    // TODO: implement call
    return await repo.sendUserRequestInfo(
      params!.firstName,
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
      params.cost,
    );
  }
}

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
    @required this.firstName,
    @required this.lastName,
    @required this.emailAddress,
    @required this.phoneNumber,
    @required this.largeBoxSizeCount,
    @required this.mediumBoxSizeCount,
    @required this.smallBoxSizeCount,
    @required this.locationName,
    @required this.apartmentName,
    @required this.roomNumber,
    @required this.address,
    @required this.cost,
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
        address,
        cost
      ];
}
