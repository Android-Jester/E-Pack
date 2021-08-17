import 'package:appwrite/appwrite.dart' as appwrite;

class DatabaseAccess extends appwrite.Client {
  DatabaseAccess() {
    appwrite.Database database = appwrite.Database(appwrite.Client()
        .setEndpoint('http://localhost:8080/v1')
        .setProject('60f4528babe86')
        .setSelfSigned());

    Future result = database.createDocument(
      collectionId: "60f4529c27565",
      data: {},
    );

    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
    });
  }
}


// abstract class UserRequestRemoteDataSource {
//   Future<UserRequest> sendUserRequestInfo(
//       String? firstName,
//       String? lastName,
//       String? emailAddress,
//       String? phoneNumber,
//       int? largeBoxSizeCount,
//       int? mediumBoxSizeCount,
//       int? smallBoxSizeCount,
//       String? locationName,
//       String? apartmentName,
//       int? roomNumber,
//       String? address,
//       double? cost);
// }
