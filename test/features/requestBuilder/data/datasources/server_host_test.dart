import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/requestBuilder/data/models/user_request_model.dart';

void main() {
  var database = Database(AppWriteServer().userClient());
  const firstName = "Kwadwo";
  const lastName = "Duah";
  const emailAddress = "duah12@outlook.com";
  const phoneNumber = "0241119708";
  const largeBoxSizeCount = 2;
  const mediumBoxSizeCount = 2;
  const smallBoxSizeCount = 2;
  const locationName = "Ayduase";
  const apartmentName = "Whitpam A Hostel";
  const roomNumber = 213;
  const address = "Ayduase Gate";
  const cost = 2111.0;

  database
      .createDocument(
        collectionId: "60f4529c27565",
        data: UserRequestModel(
                firstName: firstName,
                lastName: lastName,
                emailAddress: emailAddress,
                phoneNumber: phoneNumber,
                largeBoxSizeCount: largeBoxSizeCount,
                mediumBoxSizeCount: mediumBoxSizeCount,
                smallBoxSizeCount: smallBoxSizeCount,
                locationName: locationName,
                apartmentName: apartmentName,
                roomNumber: roomNumber,
                address: address,
                cost: cost)
            .toJson(),
      )
      .then((value) => print(value))
      .catchError((error) => print(error));
}
