import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_model.dart';
import 'package:http/http.dart' as net;

abstract class StorageDataReceiver {
  Future<void> sendStorageRequest({
    required StorageRequestModel model,
  });
}

class StorageDataReceiverImpl implements StorageDataReceiver {

  @override
  Future<void> sendStorageRequest({
    required StorageRequestModel model,
  }) async {
    net.Response response = await net.post(Uri.parse("$api/$client/storage"),
    body: model.toJson(),
    );
    print(response.body);
  }
}
