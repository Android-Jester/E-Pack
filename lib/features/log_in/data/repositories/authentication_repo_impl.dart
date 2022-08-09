import 'package:dartz/dartz.dart';

import '../../../../core/core_errors/exceptions.dart';
import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/network.dart';
import '../../domain/entities/login_response.dart';
import '../../domain/repositories/auth_repo.dart';
import '../datasources/auth_server.dart';
import '../datasources/local_auth_server.dart';
import '../model/login_model.dart';

typedef _GetModelInstance = Future<LoginResponse> Function();

class AuthRepoImpl implements AuthRepo {
  final LoginServer webServer;
  final LocalLoginServer localServer;
  final NetworkInfo networkInfo;

  @override
  AuthRepoImpl({
    required this.webServer,
    required this.localServer,
    required this.networkInfo,
  });

  Future<Either<Failure, LoginResponse>> _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      // try {
      // acquire model from the User
      try {
        final model = await responseModel();
        //sending the model to datasource
        // localServer.cacheLoginInfo(username: username);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> authenticateUser(String email, String password) async => await _getResponse(() async {
        return webServer.loginUser(model: LoginModel(email: email, password: password));
      });
}
