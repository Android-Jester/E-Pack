import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/error/exceptions.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';

// class DatabaseAccess extends appwrite.Client {

abstract class UserRequestRemoteDataSource {
  Future<UserRequest> sendUserRequestInfo(
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

class UserRequestDataSourceImpl implements UserRequestRemoteDataSource {
  final Client client;

  UserRequestDataSourceImpl({required this.client});

  @override
  Future<UserRequest> sendUserRequestInfo(
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
    Database database = Database(client);

    Future<UserRequest> result = database.createDocument(
      collectionId: "60f4529c27565",
      data: {
        "firstName: ": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "phoneNumber": phoneNumber,
        "largeBoxSizeCount": largeBoxSizeCount,
        "mediumBoxSizeCount": mediumBoxSizeCount,
        "smallBoxSizeCount": smallBoxSizeCount,
        "locationName": locationName,
        "apartmentName": apartmentName,
        "roomNumber": roomNumber,
        "address": address,
        "cost": cost
      },
    ) as Future<UserRequest>;

    result.then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
      throw ServerException();
    });

    return result;
  }

  // Future<UserRequest> _sendUserRequest(String url) async {

  //   if (response.statusCode == 200) {
  //     return NumberTriviaModel.fromJson(json.decode(response.body));
  //   } else {
  //     throw ServerException();
  //   }
  // }
}
