import 'package:dartz/dartz.dart';

import '../../../../core/core_errors/failures.dart';
import '../entities/register_response.dart';


abstract class RegisterRepo {
  final String username = "";
  Future<Either<Failure, RegistrationResponse>> registerUser(String email, String password, String name);
}
