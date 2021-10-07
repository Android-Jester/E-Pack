import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/requestBuilder/data/datasources/server_host.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:e_pack/features/requestBuilder/domain/repositories/user_request_repo.dart';

class UserRequestRepositoryImpl implements UserRequestRepository {
  final ServerHost serverHost;
  final NetworkInfo networkInfo;

  UserRequestRepositoryImpl(
      {required this.serverHost, required this.networkInfo});

  @override
  // TODO: implement request
  UserRequest get request => throw UnimplementedError();

  @override
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
  ) async {
    networkInfo.isConnected;
    try {
      final remoteTrivia = await serverHost.sendUserRequest(
        firstName,
        lastName,
        emailAddress,
        timeDeposition,
        semesterPeriod,
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,
        roomType,
        storageWeeks,
        residenceName,
        roomNumber,
        phoneNumber,
        addressType,
        accessNote,
        locationName,
        localPhoneNum,
        whatsPhoneNum,
        contactTimes,
        momoFullName,
        momoPhoneNum,
        cost,
      );
      return Right(remoteTrivia!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
