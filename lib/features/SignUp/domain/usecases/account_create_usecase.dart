import 'package:appwrite/models.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:e_pack/core/UseCase/usecase.dart';
import 'package:e_pack/features/SignUp/domain/entities/account_create_entities.dart';
import 'package:e_pack/features/SignUp/domain/repositories/account_create_repo.dart';
import 'package:equatable/equatable.dart';

class RegisterUser extends UseCase<UserAccount, UserParams> {
  final UserAccountRepo? repo;

  RegisterUser({this.repo});
  
  @override
  Future<Either<Failure, UserAccount>?>? call(UserParams params) async{
    return await repo!.registerUser(
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
      password: params.password,
    );
  }
  
}

class UserParams extends Equatable {
    final String? firstName;
    final String? lastName;
    final String? email;
    final String? password;
  
UserParams({this.firstName, this.lastName, this.email, this.password});

  @override
  List<Object?> get props => throw UnimplementedError();

}
