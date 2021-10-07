import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/requestBuilder/data/models/user_request_model.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';

abstract class ServerHost {
  Future<UserRequest?>? sendUserRequest(
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? timeDeposition,
    String? semesterPeriod,
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,
    String? roomType,
    int? storageWeeks,
    String? residenceName,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,
    String? locationName,
    String? localPhoneNum,
    String? whatsPhoneNum,
    int? contactTimes,
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  );
}

class ServerHostImpl implements ServerHost {
  Database database = Database(AppWriteServer().userClient());
  UserRequestModel? model;

  ServerHostImpl();

  @override
  Future<UserRequest>? sendUserRequest(
    String? firstName,
    String? lastName,
    String? emailAddress,
    String? timeDeposition,
    String? semesterPeriod,
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,
    String? roomType,
    int? storageWeeks,
    String? residenceName,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,
    String? locationName,
    String? localPhoneNum,
    String? whatsPhoneNum,
    int? contactTimes,
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  ) {
    model = UserRequestModel(
      firstName: firstName,
      lastName: lastName,
      emailAddress: emailAddress,
      timeDeposition: timeDeposition,
      semesterPeriod: semesterPeriod,
      roomType: roomType,
      storageWeeks: storageWeeks,
      residenceName: residenceName,
      phoneNumber: phoneNumber,
      largeBoxSizeCount: largeBoxSizeCount,
      mediumBoxSizeCount: mediumBoxSizeCount,
      smallBoxSizeCount: smallBoxSizeCount,
      locationName: locationName,
      localPhoneNum: localPhoneNum,
      whatsPhoneNum: whatsPhoneNum,
      accessNote: accessNote,
      roomNumber: roomNumber,
      addressType: addressType,
      contactTimes: contactTimes,
      momoFullName: momoFullName,
      momoPhoneNum: momoPhoneNum,
      cost: cost,
    );
    database.createDocument(
        collectionId: '60f4529c27565', data: model!.toJson());
    return null;
  }
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
