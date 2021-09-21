import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';

abstract class ServerHost {
  Future sendUserRequest(Map<String, dynamic> data);
}

class ServerHostImpl implements ServerHost {
  Database database = Database(appwrite_server().client);

  ServerHostImpl();

  @override
  Future sendUserRequest(Map<String, dynamic> data) =>
      database.createDocument(collectionId: '60f4529c27565', data: data);
}

// String collectionId = '60f4529c27565';
// late Database database;
// final UserRequest? request;
// ServerHost(Client client, {required this.request}) {
//   database = Database(client);
//
//
//   result.then((value) => print(value)).catchError((e) => print(e));
// }
//
// updateDocument(Future result) {
//   database.updateDocument(collectionId: collectionId, documentId: , data: UserRequestRepoImpl(request!).sendUserRequest())
// }
// }
