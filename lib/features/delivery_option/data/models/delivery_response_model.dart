
import '../../domain/entities/response.dart';

class DeliveryResponseModel extends DeliveryResponse {
  DeliveryResponseModel({required String deliveryKey}): super(deliveryKey: deliveryKey);


  factory DeliveryResponseModel.fromJSON(Map<String, dynamic> json) {
    return DeliveryResponseModel(deliveryKey: json['deliveryKey']);
  }
}