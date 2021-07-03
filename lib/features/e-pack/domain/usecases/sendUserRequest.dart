import 'package:e_pack/core/error/failures.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';
import 'package:e_pack/features/e-pack/domain/repositories/userInfoRepository.dart';
import 'package:dartz/dartz.dart';

class GetUserRequestInfo {
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
}
