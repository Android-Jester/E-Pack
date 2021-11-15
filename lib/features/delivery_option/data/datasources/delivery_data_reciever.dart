import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';

abstract class DeliveryDataReciever {
  Future<DeliveryRequest> sendDeliveryRequest(DeliveryRequestModel? model);
}

class DeliveryDataRecieverImpl implements DeliveryDataReciever {
  Database database = Database(AppWriteServer().initClient());

  Future<DeliveryRequest> _getResponseFromServer(
      DeliveryRequestModel model) async {
    var response;
    Future result = database.createDocument(
      collectionId: '6185f5ac8eb3e',
      data: model.toJson(),
    );
    result
        .then((value) => response)
        .catchError((_) => ServerException("data cannot be sent"));
    return response;
  }

  @override
  Future<DeliveryRequest> sendDeliveryRequest(DeliveryRequestModel? model) =>
      _getResponseFromServer(model!);
}
