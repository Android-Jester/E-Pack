import 'package:dartz/dartz.dart';
import 'package:e_pack_final/core/core_errors/failures.dart';
import 'package:e_pack_final/core/core_usage/classes/usecase.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/initialize_response_entity.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/momo_response.dart';
import 'package:equatable/equatable.dart';

import '../repositories/momo_repository.dart';

class InitializePayment extends UseCase<InitializeResponseEntity, PaymentParams> {
  final PaymentRepository repo;
  InitializePayment(this.repo);

  @override
  Future<Either<Failure, InitializeResponseEntity>> call({required PaymentParams params}) {
    return repo.initalizeService(email: params.email, amount: params.amount, callbackUrl: params.callbackUrl);
  }
}


class PaymentParams extends Equatable {
  final String email;
  final double amount;
  final String callbackUrl;

  const PaymentParams({required this.email, required this.amount, required this.callbackUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [email, amount, callbackUrl];

}