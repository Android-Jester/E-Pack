import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/SignUp/domain/entities/account_create_entities.dart';
import 'package:dartz/dartz.dart';

abstract class UserAccountRepo {
  final UserAccount? account;
  UserAccountRepo({this.account});

  Future<Either<Failure, UserAccount>?>? registerUser({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  });
}
