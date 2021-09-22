import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/requestBuilder/data/datasources/server_host.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:e_pack/features/requestBuilder/domain/repositories/user_request_repo.dart';

class UserRequestRepoImpl implements UserRequestRepository {
  final ServerHostImpl serverHostImpl;

  UserRequestRepoImpl({required this.serverHostImpl});

  @override
  // TODO: implement request
  UserRequest get request => throw UnimplementedError();

  @override
  Future<Either<Failure, UserRequest>> sendUserRequest() {
    throw UnimplementedError();
  }
}
