import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/sign_up/data/datasources/register_server.dart';
import 'package:e_pack/features/sign_up/data/models/register_user_model.dart';
import 'package:e_pack/features/sign_up/domain/entities/registering_user.dart';
import 'package:e_pack/features/sign_up/domain/repositories/registering_user_repo.dart';

import '../../domain/entities/register_response.dart';

typedef _GetModelInstance = Future<RegistrationResponse> Function();

class RegisterRepoImpl implements RegisterRepo {
  final RegisterServer authServer;
  final NetworkInfo networkInfo;
  @override String username ="";

  RegisterRepoImpl({
    required this.networkInfo,
    required this.authServer,
  }): super();

  Future<Either<Failure, RegistrationResponse>> _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = await responseModel();
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      print("No Data Exception");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, RegistrationResponse>> registerUser(String email, String password, String name) =>
      _getResponse(() async => authServer.registerUser(model: RegisterUserModel(email: email, password: password, name: name)));
}
