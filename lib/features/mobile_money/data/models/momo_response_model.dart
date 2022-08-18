import 'package:e_pack_final/features/mobile_money/domain/entities/momo_response.dart';

class VerifyPaymentResponseModel extends VerifyPaymentResponseEntity {
  VerifyPaymentResponseModel({required bool status, required Map<String, dynamic> data}) : super(status: status, data: data);

  factory VerifyPaymentResponseModel.fromJSON(Map<String, dynamic> json) => VerifyPaymentResponseModel(status: json['status'], data: json['data']);

}