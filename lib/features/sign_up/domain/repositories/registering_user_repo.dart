import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/sign_up/domain/entities/registering_user.dart';

abstract class RegisterRepo {
  final String username = "";
  Future<Either<Failure, RegisterUser>> registerUser(String email, String password, String name);
}
