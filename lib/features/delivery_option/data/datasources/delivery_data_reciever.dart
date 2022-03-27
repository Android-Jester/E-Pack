import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import "package:http/http.dart" as net;
abstract class DeliveryDataReciever {
  Future<void> sendDeliveryRequest({required DeliveryRequestModel model});
}

class DeliveryDataRecieverImpl implements DeliveryDataReciever {
  final String username;

  DeliveryDataRecieverImpl({required this.username});
  @override
  Future<void> sendDeliveryRequest({required DeliveryRequestModel model}) async {
    net.Response response = await net.post(
      Uri.parse("$api/$delivery?username="),
      body: model.toJson(),
    );
  }
}
