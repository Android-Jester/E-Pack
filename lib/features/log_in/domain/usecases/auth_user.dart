import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/UseCase/usecase.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

class AuthenticatingUser extends UseCase<AuthUser, Params> {
  final AuthRepo repo;
  AuthenticatingUser({required this.repo});
  @override
  Future<Either<Failure, AuthUser>> call({required Params params}) {
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
