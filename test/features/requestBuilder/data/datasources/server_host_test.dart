import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/requestBuilder/data/models/user_request_model.dart';

void main() {
  var database = Database(AppWriteServer().userClient());
  const tfirstName = "Kwadwo";
  const tmiddleName = "Adjei";
  const tlastName = "Duah";
  const temailAddress = "duah12@outlook.com";
  const ttimeDeposition = "24-10-2021; 14:00";
  const tsemesterPeriod = "Second Semester";
  const troomType = "Single Room";
  const tlargeBoxSizeCount = 5;
  const tmediumBoxSizeCount = 2;
  const tsmallBoxSizeCount = 1;
  const tstorageWeeks = 6;
  const tresidenceName = "Whitpam A Hostel";
  const troomNumber = 213;
  const tphoneNumber = "0201317498";
  const taddressType = "Ayduase Gate";
  const taccessNote = "0201317498";
  const tcurrentLocation = "Tamale";
  const tlocalPhoneNum = "0201317498";
  const twhatsPhoneNum = "0201317498";
  const tcontactTimes = 3;
  const tmomoFullName = "$tfirstName $tmiddleName $tlastName";
  const tmomoPhoneNum = "0201317498";

  const tlocationName = "Ayduase";
  const tcost = 2550.0;

  database
      .createDocument(
        collectionId: "60f4529c27565",
        data: UserRequestModel(
          firstName: tfirstName,
          lastName: tlastName,
          emailAddress: temailAddress,
          timeDeposition: ttimeDeposition,
          semesterPeriod: tsemesterPeriod,
          roomType: troomType,
          storageWeeks: tstorageWeeks,
          residenceName: tresidenceName,
          phoneNumber: tphoneNumber,
          largeBoxSizeCount: tlargeBoxSizeCount,
          mediumBoxSizeCount: tmediumBoxSizeCount,
          smallBoxSizeCount: tsmallBoxSizeCount,
          locationName: tlocationName,
          localPhoneNum: tlocalPhoneNum,
          whatsPhoneNum: twhatsPhoneNum,
          accessNote: taccessNote,
          roomNumber: troomNumber,
          addressType: taddressType,
          contactTimes: tcontactTimes,
          momoFullName: tmomoFullName,
          momoPhoneNum: tmomoPhoneNum,
          cost: tcost,
        ).toJson(),
      )
      .then((value) => print(value))
      .catchError((error) => print(error));
}
