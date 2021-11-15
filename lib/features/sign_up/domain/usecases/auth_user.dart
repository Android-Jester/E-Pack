import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/UseCase/usecase.dart';
import 'package:e_pack/features/sign_up/domain/entities/registering_user.dart';
import 'package:e_pack/features/sign_up/domain/repositories/registering_user_repo.dart';
import 'package:equatable/equatable.dart';

class RegisteringUser extends UseCase<RegisterUser, Params> {
  final RegisterRepo repo;

  RegisteringUser({required this.repo});
  @override
  Future<Either<Failure, RegisterUser>?>? call(Params params) {
    return repo.registeruser(params.email!, params.password!, params.name!);
  }
}

class Params extends Equatable {
  String? email;
  String? password;
  String? name;

  Params({required this.email, required this.password, required this.name});

  @override
  List<Object?> get props => [email, password, name];
}
