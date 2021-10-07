import 'dart:convert';

import 'package:e_pack/features/requestBuilder/data/models/user_request_model.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
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

  final tUserRequestModel = UserRequestModel(
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
  );

  test("should be a subclass of UserRequest entity", () async {
    expect(tUserRequestModel, isA<UserRequest>());
  });

  group("fromJSON", () {
    test('should return a valid model', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('request.json'));

      //act
      final result = UserRequestModel.fromJson(jsonMap);

      //assert
      expect(result, tUserRequestModel);
    });
  });
}
