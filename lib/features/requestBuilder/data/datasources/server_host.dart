import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';

abstract class ServerHost {
  Future<UserRequest?>? sendUserRequest(
      String? firstName,
      String? lastName,
      String? emailAddress,
      String? phoneNumber,
      int? largeBoxSizeCount,
      int? mediumBoxSizeCount,
      int? smallBoxSizeCount,
      String? locationName,
      String? apartmentName,
      int? roomNumber,
      String? address,
      double? cost);
}

class ServerHostImpl implements ServerHost {
  Database database = Database(appwrite_server().client);

  ServerHostImpl();

  @override
  Future<UserRequest>? sendUserRequest(
      String? firstName,
      String? lastName,
      String? emailAddress,
      String? phoneNumber,
      int? largeBoxSizeCount,
      int? mediumBoxSizeCount,
      int? smallBoxSizeCount,
      String? locationName,
      String? apartmentName,
      int? roomNumber,
      String? address,
      double? cost) {
    return null;
  }
  // database.createDocument(collectionId: '60f4529c27565', data: data);
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
