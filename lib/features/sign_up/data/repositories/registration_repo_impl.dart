import 'package:dartz/dartz.dart';
import 'package:e_pack_final/features/log_in/data/datasources/local_auth_server.dart';

import '../../../../core/core_errors/exceptions.dart';
import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/network.dart';
import '../../domain/entities/register_response.dart';
import '../../domain/repositories/registering_user_repo.dart';
import '../datasources/register_server.dart';
import '../models/register_user_model.dart';

typedef _GetModelInstance = Future<RegistrationResponse> Function();

class RegisterRepoImpl implements RegisterRepo {
  final RegisterServer webServer;
  final LocalLoginServer localServer;
  final NetworkInfo networkInfo;

  @override
  String username = "";
  RegisterRepoImpl({
    required this.networkInfo,
    required this.webServer,
    required this.localServer,
  });

  Future<Either<Failure, RegistrationResponse>> _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await responseModel();
        localServer.cacheLoginInfo(username: username);
        return Right(model);
      } on ServerException {
        username = await localServer.getUsername();
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RegistrationResponse>> registerUser(String email, String password, String name) async {
    username = name;
    return _getResponse(() async {
      return webServer.registerUser(model: RegisterUserModel(email: email, password: password, name: name));
    });
  }
}
