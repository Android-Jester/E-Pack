import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/log_in/data/datasources/auth_server.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef _GetModelInstance = Future<AuthUser> Function();

class AuthRepoImpl implements AuthRepo {
  final AuthServer authServer;
  NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker());

  AuthRepoImpl({required this.authServer});

  Future<Either<Failure, AuthUser>?> _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      // try {
      // acquire model from the User
      try {
        final model = await responseModel();
        //sending the model to datasource

        await authServer.loginUser(email: model.email, password: model.password).timeout(Duration(minutes: 2));
        return Right(model);
      } on ServerException {
        print("Exception");
        return Left(ServerFailure());
      }
    } else {
      print("No Data Exception");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthUser>?> authenticateUser(String email, String password) async =>
      await _getResponse(() async => AuthUser(email: email, password: password));
}
