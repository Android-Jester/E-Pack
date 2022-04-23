import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/classes/usecase.dart';
import '../entities/register_response.dart';
import '../repositories/registering_user_repo.dart';

class RegisteringUser extends UseCase<RegistrationResponse, Params> {
  final RegisterRepo repo;

  RegisteringUser({required this.repo});
  @override
  Future<Either<Failure, RegistrationResponse>> call({required Params params}) {
    return repo.registerUser(params.email, params.password, params.name);
  }
}

class Params extends Equatable {
  String email;
  String password;
  String name;

  Params({required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [email, password, name];
}
