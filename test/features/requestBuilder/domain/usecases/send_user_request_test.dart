import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'send_user_request_test.mocks.dart';

@GenerateMocks([UserRequestRepository])
void main() {
  SendUserRequest? usecase;
  var mockUserRequestRepository;

  setUp(() {
    mockUserRequestRepository = MockUserRequestRepository();
    usecase = SendUserRequest(mockUserRequestRepository!);
  });

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
  final UserRequest? tUserRequest = UserRequest(
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

  test("sends a request to the database", () async {
    when(mockUserRequestRepository!.sendUserRequest(
      tfirstName,
      tmiddleName,
      tlastName,
      temailAddress,
      ttimeDeposition,
      tsemesterPeriod,
      troomType,
      tlargeBoxSizeCount,
      tmediumBoxSizeCount,
      tsmallBoxSizeCount,
      tstorageWeeks,
      tresidenceName,
      troomNumber,
      tphoneNumber,
      taddressType,
      taccessNote,
      tcurrentLocation,
      tlocalPhoneNum,
      twhatsPhoneNum,
      tcontactTimes,
      tmomoFullName,
      tmomoPhoneNum,
      tlocationName,
      tcost,
    )).thenAnswer((_) async {
      return Right(tUserRequest);
    });
    final result = await usecase!(const Params(
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
    ));
    expect(result, Right(tUserRequest));

    verify(mockUserRequestRepository!.sendUserRequest(
      tfirstName,
      tmiddleName,
      tlastName,
      temailAddress,
      ttimeDeposition,
      tsemesterPeriod,
      troomType,
      tlargeBoxSizeCount,
      tmediumBoxSizeCount,
      tsmallBoxSizeCount,
      tstorageWeeks,
      tresidenceName,
      troomNumber,
      tphoneNumber,
      taddressType,
      taccessNote,
      tcurrentLocation,
      tlocalPhoneNum,
      twhatsPhoneNum,
      tcontactTimes,
      tmomoFullName,
      tmomoPhoneNum,
      tlocationName,
      tcost,
    ));
  });

  // verifyNoMoreInteractions(mockUserRequestRepository);
}
