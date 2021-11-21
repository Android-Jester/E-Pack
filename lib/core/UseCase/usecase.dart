import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>?>? call(Params params);
}
