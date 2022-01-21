import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';

abstract class DeliveryDataReciever {
  Future<Document> sendDeliveryRequest({required DeliveryRequestModel model});
}

class DeliveryDataRecieverImpl implements DeliveryDataReciever {
  Database database = Database(AppWriteServer.initClient());

  @override
  Future<Document> sendDeliveryRequest({required DeliveryRequestModel model}) {
    return database
        .createDocument(
      collectionId: '6185f5ac8eb3e',
      data: model.toJson(),
    )
        .catchError((e) {
      throw ServerException("You cannot Send that");
    });
  }
}
