import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/log_in/data/datasources/auth_server.dart';
import 'package:e_pack/features/log_in/data/datasources/local_auth_server.dart';
import 'package:e_pack/features/log_in/data/model/login_model.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';
import 'package:e_pack/features/log_in/domain/entities/login_response.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';

typedef _GetModelInstance = Future<LoginResponse> Function();

class AuthRepoImpl implements AuthRepo {
  final LoginServer server;
  final LocalLoginServer localServer;
  NetworkInfo networkInfo;

  @override String username = "";
  AuthRepoImpl({
    required this.server,
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
        localServer.cacheLoginInfo(username: username);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginResponse>> authenticateUser(String email, String password) async =>
      await _getResponse(() async => server.loginUser(model: LoginModel(email: email, password: password)));
}
