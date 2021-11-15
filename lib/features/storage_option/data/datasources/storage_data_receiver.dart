import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_model.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';

abstract class StorageDataReceiver {
  Future<StorageRequest?>? sendStorageRequest(StorageRequestModel? model);
}

class StorageDataReceiverImpl implements StorageDataReceiver {
  Database database = Database(AppWriteServer().initClient());
  StorageRequestModel? model;

  StorageDataReceiverImpl();
  Future<StorageRequest> _getResponseFromServer(
      StorageRequestModel model) async {
    var response;
    Future result = database.createDocument(
      collectionId: '6185f59c8c38e',
      data: model.toJson(),
    );
    result
        .then((value) => response)
        .catchError((_) => ServerException("data cannot be sent"));
    return response;
  }

  @override
  Future<StorageRequest> sendStorageRequest(StorageRequestModel? model) =>
      _getResponseFromServer(model!);
}
