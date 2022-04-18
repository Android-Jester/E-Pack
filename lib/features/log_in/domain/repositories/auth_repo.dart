import 'package:dartz/dartz.dart';

import '../../../../core/core_errors/failures.dart';
import '../entities/login_response.dart';

abstract class AuthRepo {
 final String username = "";
  Future<Either<Failure, LoginResponse>> authenticateUser(String email, String password);
}
