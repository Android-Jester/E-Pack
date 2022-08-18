
import 'package:dartz/dartz.dart';
import 'package:e_pack_final/core/core_errors/failures.dart';
import 'package:e_pack_final/core/core_usage/classes/usecase.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/momo_response.dart';
import 'package:equatable/equatable.dart';

class VerifyTransaction extends UseCase<VerifyPaymentResponseEntity, VerifyParam> {
  @override
  Future<Either<Failure, VerifyPaymentResponseEntity>> call({required VerifyParam params}) {
    // TODO: implement call
    throw UnimplementedError();
  }

}

class VerifyParam extends Equatable {
  final String reference;

  const VerifyParam(this.reference);

  @override
  // TODO: implement props
  List<Object?> get props => [reference];
}