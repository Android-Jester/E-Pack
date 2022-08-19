
import 'package:dartz/dartz.dart';
import 'package:e_pack_final/core/core_errors/failures.dart';
import 'package:e_pack_final/core/core_usage/classes/usecase.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/momo_response.dart';
import 'package:equatable/equatable.dart';

import '../repositories/momo_repository.dart';

class VerifyTransaction extends UseCase<VerifyPaymentResponseEntity, VerifyParam> {
  final PaymentRepository repo;
  VerifyTransaction(this.repo);
  @override
  Future<Either<Failure, VerifyPaymentResponseEntity>> call({required VerifyParam params}) {
    return repo.verifyPayment(reference: params.reference);
  }

}

class VerifyParam extends Equatable {
  final String reference;

  const VerifyParam(this.reference);

  @override
  // TODO: implement props
  List<Object?> get props => [reference];
}