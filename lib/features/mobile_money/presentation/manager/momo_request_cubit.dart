
import 'package:bloc/bloc.dart';
import 'package:e_pack_final/features/mobile_money/domain/use_cases/verify_transaction.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/request_payment.dart';

part 'momo_request_state.dart';

class PaymentRequestCubit extends Cubit<PaymentRequestState> {
  final InitializePayment service;
  final VerifyTransaction verifyTransaction;
  PaymentRequestCubit({required this.service, required this.verifyTransaction,}) : super(PaymentRequestInitial());

  Stream<PaymentRequestState> payAmount({required String email, required double amount}) async* {
    var services = await service(params: PaymentParams(email: email, amount: amount, callbackUrl: "https://google.com"));
    yield PaymentRequestLoading();
    yield* services.fold(
            (l) async* {
              yield PaymentRequestError();
            }, (r) async* {
            yield PaymentRequestLoading();
            yield PaymentRequestLoaded(
              url: r.data['authorization_url'],
                reference: r.data['reference'],);
    });
  }

  void moveToVerify() {

  }


Stream<PaymentRequestState> verifyAmount({required String reference}) async* {
  var services = await verifyTransaction(params: VerifyParam(reference));
  yield PaymentRequestLoading();
  yield* services.fold(
          (l) async* {
        yield PaymentRequestError();
      }, (r) async* {
    yield PaymentRequestLoading();
    yield VerifyTransactionLoaded(r.status);
  });
}
}