import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';

abstract class AuthRepo {
 final String username = "";
  Future<Either<Failure, AuthUser>> authenticateUser(String email, String password);
}
