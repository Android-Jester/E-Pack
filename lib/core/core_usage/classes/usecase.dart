import 'package:dartz/dartz.dart';

import '../../core_errors/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}