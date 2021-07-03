import 'package:e_pack/core/error/failures.dart';
import 'package:e_pack/core/usecases/usecase.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';
import 'package:e_pack/features/e-pack/domain/repositories/userInfoRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetUserRequestInfo extends UseCase<UserRequest, Params> {
  final UserRequestRepository repo;

  GetUserRequestInfo({required this.repo});

  Future<Either<Failure, UserRequest>> execute(
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
      required double cost}) async {
    return await repo.sendUserRequestInfo(
        address: '',
        apartmentName: '',
        cost: null,
        emailAddress: '',
        firstName: '',
        largeBoxSizeCount: null,
        lastName: '',
        locationName: '',
        mediumBoxSizeCount: null,
        phoneNumber: '',
        roomNumber: null,
        smallBoxSizeCount: null);
  }

  @override
  Future<Either<Failure, UserRequest>> call(Params params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class Params extends Equatable {
  final String firstName;
  final String lastName;
  final String emailAddress;
  final String phoneNumber;
  final int? largeBoxSizeCount;
  final int? mediumBoxSizeCount;
  final int? smallBoxSizeCount;
  final String locationName;
  final String apartmentName;
  final int? roomNumber;
  final String address;
  final double? cost;

  Params(
      {required this.firstName,
      required this.lastName,
      required this.emailAddress,
      required this.phoneNumber,
      required this.largeBoxSizeCount,
      required this.mediumBoxSizeCount,
      required this.smallBoxSizeCount,
      required this.locationName,
      required this.apartmentName,
      required this.roomNumber,
      required this.address,
      required this.cost});

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
        address,
        cost
      ];
}
