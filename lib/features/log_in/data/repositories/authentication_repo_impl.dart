import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/log_in/data/datasources/auth_server.dart';
import 'package:e_pack/features/log_in/data/models/auth_model.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef Future<AuthUser> _GetModelInstance();

class AuthRepoImpl implements AuthRepo {
  final AuthServer authServer;
  NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker());

  AuthRepoImpl({required this.authServer});

  Future<Either<Failure, AuthUser>?> _getResponse(
      _GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await responseModel();
        authServer.sendAuthenticationData(
            email: model.email, password: model.password);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      print("Hello darkness");

      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthUser>?> authenticateUser(
          String email, String password) async =>
      await _getResponse(
          () async => AuthUserModel(email: email, password: password));
}
