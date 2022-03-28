import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';

import '../entities/login_response.dart';

abstract class AuthRepo {
 final String username = "";
  Future<Either<Failure, LoginResponse>> authenticateUser(String email, String password);
}
