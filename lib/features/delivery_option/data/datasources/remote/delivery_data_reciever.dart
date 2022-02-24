import 'package:http/http.dart' as net;
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';

abstract class DeliveryDataRequest {
  Future<void> sendDeliveryRequest({required DeliveryRequestModel model});
}

class DeliveryDataRequestImpl implements DeliveryDataRequest {
  @override
  Future<void> sendDeliveryRequest({required DeliveryRequestModel model}) async {
    var response = await net.get(Uri.parse("url"));
  }

}