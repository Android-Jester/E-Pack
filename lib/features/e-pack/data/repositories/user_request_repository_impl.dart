import 'package:e_pack/core/platform/network_info.dart';
import 'package:e_pack/features/e-pack/data/datasources/userRequestRemoteDataSource.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';
import 'package:e_pack/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:e_pack/features/e-pack/domain/repositories/userInfoRepository.dart';

class UserRequestRepositoryImpl implements UserRequestRepository {
  final UserRequestRemoteDataSource? remoteDataSource;
  final NetworkInfo? networkInfo;
  UserRequestRepositoryImpl(
      {@required this.networkInfo, @required this.remoteDataSource});

  @override
  receiveUserIDNumber({required int number}) {
    // TODO: implement receiveUserIDNumber
    return null;
  }

  @override
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
      double? cost) {
    // TODO: implement sendUserRequestInfo
    throw UnimplementedError();
  }
}
