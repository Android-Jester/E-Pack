import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:e_pack/core/error/failures.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/e-pack/data/datasources/userRequestRemoteDataSource.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';
import 'package:e_pack/features/e-pack/domain/repositories/userInfoRepository.dart';

class UserRequestRepositoryImpl implements UserRequestRepository {
  late UserRequestDataSourceImpl remoteDataSource;
  final NetworkInfo? networkInfo;
  UserRequestRepositoryImpl({
    required this.networkInfo,
  });
  late Client client = client
      .setEndpoint('http://localhost:8080/v1') // Your API Endpoint
      .setProject('60f4528babe86');

  @override
  receiveUserIDNumber({required int number}) {
    // TODO: implement receiveUserIDNumber
    return null;
  }

  @override
  Future<Either<Failure, UserRequest>>? sendUserRequestInfo(
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
  ) {
    remoteDataSource = UserRequestDataSourceImpl(client: client);
    remoteDataSource.sendUserRequest(
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
    );
    return null;
  }

  @override
  Future<Either<Failure, UserRequest>> sendUserRequest(
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
    // TODO: implement sendUserRequest
    throw UnimplementedError();
  }

  // Future<Either<Failure, UserRequest>> _sendInformation() async {
  //   if (await networkInfo!.isConnected) {
  //     try {} catch (e) {}
  //   }
  // }
}
