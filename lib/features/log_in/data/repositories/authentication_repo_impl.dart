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

  @override
  Future<Either<Failure, LoginResponse>> authenticateUser(String email, String password) async {
    print("Network State: " + (await networkInfo.isConnected).toString());
    if (await networkInfo.isConnected) {
      // try {
      // acquire model from the User
      var loginModel = LoginModel(email: email, password: password);
      try {
        final model = await webServer.loginUser(model: loginModel);
        //sending the model to datasource
        localServer.cacheLoginInfo(username: loginModel.email);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final model = await localServer.getUsername();
        return Right(model);
      } catch(e) {
        return Left(LocalFailure());
      }
    }
  }
}
