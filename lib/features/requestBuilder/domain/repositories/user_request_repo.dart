import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';

abstract class UserRequestRepo {
  final UserRequest request;
  UserRequestRepo({required this.request});

  Future<Either<Failure, Map<String, UserRequest>>> sendUserRequest();
}
