
import 'package:dartz/dartz.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/initialize_response_entity.dart';

import '../../../../core/core_errors/failures.dart';
import '../entities/momo_response.dart';

abstract class PaymentRepository {
  Future<Either<Failure, InitializeResponseEntity>> initalizeService({required String email, required double amount});
  Future<Either<Failure, VerifyPaymentResponseEntity>> verifyPayment({required String reference});
}