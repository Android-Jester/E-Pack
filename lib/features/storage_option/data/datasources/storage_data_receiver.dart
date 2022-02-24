import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_model.dart';

abstract class StorageDataReceiver {
  Future<Document> sendStorageRequest({
    required StorageRequestModel model,
  });
}

class StorageDataReceiverImpl implements StorageDataReceiver {
  Database database = Database(AppWriteServer.initClient());

  @override
  Future<Document> sendStorageRequest({
    required StorageRequestModel model,
  }) {
    return database
        .createDocument(
      collectionId: '6185f59c8c38e',
      data: model.toJson(),
    )
        .catchError((e) {
      throw ServerException(e);
    });
  }
}
