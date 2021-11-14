import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/log_in/data/datasources/auth_server.dart';
import 'package:e_pack/features/log_in/data/models/auth_model.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';

typedef AuthUserModel _GetModelInstance();

class AuthRepoImpl implements AuthRepo {
  final AuthServer authServer;
  final NetworkInfo networkInfo;

  AuthRepoImpl({required this.authServer, required this.networkInfo});

  Future<Either<Failure, AuthUser>?> _getResponse(
      _GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = responseModel();
        authServer.sendAuthenticationData(
            email: model.email, password: model.password);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, AuthUser>?>? authenticateUser(
          String email, String password) =>
      _getResponse(() => AuthUserModel(email: email, password: password));
}
