import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/classes/usecase.dart';
import '../entities/login_response.dart';
import '../repositories/auth_repo.dart';

class AuthenticatingUser extends UseCase<LoginResponse, Params> {
  final AuthRepo repo;
  AuthenticatingUser({required this.repo});
  @override
  Future<Either<Failure, LoginResponse>> call({required Params params}) {
    return repo.authenticateUser(params.email, params.password);
  }
}

class Params extends Equatable {
  String email;
  String password;

  Params({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
