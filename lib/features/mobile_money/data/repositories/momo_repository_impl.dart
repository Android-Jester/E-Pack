import 'package:dartz/dartz.dart';
import 'package:e_pack_final/core/core_errors/failures.dart';
import 'package:e_pack_final/core/core_usage/network.dart';
import 'package:e_pack_final/features/mobile_money/data/models/initalize_request_model.dart';
import 'package:e_pack_final/features/mobile_money/data/models/momo_request_model.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/initialize_response_entity.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/momo_response.dart';
import 'package:e_pack_final/features/mobile_money/domain/repositories/momo_repository.dart';

import '../data_sources/momo_request_source.dart';

class PaymentRepoImpl extends PaymentRepository {
  final NetworkInfo netInfo;
  final PaymentForm payment;

  PaymentRepoImpl({
    required this.netInfo,
    required this.payment,
});

  // @override
  // Future<Either<Failure, PaymentResponseEntity>> payForService({required String email, required double amount}) async {

  // }

  @override
  Future<Either<Failure, InitializeResponseEntity>> initalizeService({required String email, required double amount}) async {
    try {
      if (await netInfo.isConnected) {
        var requestModel = InitializeRequestModel(email: email, amount: amount);
        final model = await payment.initialize(model: requestModel);
        return Right(model);
      } else {
        return Left(ServerFailure());
      }
    } catch(e) {
      return Left(ServerFailure());
    }
  }
  @override
  Future<Either<Failure, VerifyPaymentResponseEntity>> verifyPayment({required String reference}) async {
    try {
      if (await netInfo.isConnected) {
        var verify = VerifyPaymentRequestModel(reference: reference);
        final model = await payment.verifyTransaction(verify);
        return Right(model);
      } else {
        return Left(ServerFailure());
      }
    } catch(e) {
      return Left(ServerFailure());
    }
  }
}