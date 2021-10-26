import 'package:dartz/dartz.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_request_repository_impl_test.mocks.dart';

@GenerateMocks([ServerHost, NetworkInfo])
void main() {
  UserRequestRepositoryImpl? repository;
  var mockServerHost;
  var mockNetworkInfo;

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

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockServerHost = MockServerHost();
    repository = UserRequestRepositoryImpl(
        serverHost: mockServerHost, networkInfo: mockNetworkInfo);
  });

  group('request sender', () {
    test('check if device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      //act
      // repository!.sendUserRequest(
      //     tfirstName,
      //     tlastName,
      //     temailAddress,
      //     tphoneNumber,
      //     tlargeBoxSizeCount,
      //     tmediumBoxSizeCount,
      //     tsmallBoxSizeCount,
      //     tlocationName,
      //     tapartmentName,
      //     troomNumber,
      //     taddress,
      //     tcost);

      //assert
      verifyNever(mockNetworkInfo.isConnected);
      // verify(result);
    });
  });

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test('should send the info to the database', () async {
      //arrange
      when(mockServerHost.sendUserRequest(
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
      )).thenAnswer((_) async => tUserRequest);

      //act
      final result = await repository!.sendUserRequest(
        tfirstName,
        tlastName,
        temailAddress,
        ttimeDeposition,
        tsemesterPeriod,
        tlargeBoxSizeCount,
        tmediumBoxSizeCount,
        tsmallBoxSizeCount,
        troomType,
        tstorageWeeks,
        tresidenceName,
        troomNumber,
        tphoneNumber,
        taddressType,
        taccessNote,
        tlocationName,
        tlocalPhoneNum,
        twhatsPhoneNum,
        tcontactTimes,
        tmomoFullName,
        tmomoPhoneNum,
        tcost,
      );

      //assert
      verify(mockServerHost.sendUserRequest(
        tfirstName,
        tlastName,
        temailAddress,
        ttimeDeposition,
        tsemesterPeriod,
        tlargeBoxSizeCount,
        tmediumBoxSizeCount,
        tsmallBoxSizeCount,
        troomType,
        tstorageWeeks,
        tresidenceName,
        troomNumber,
        tphoneNumber,
        taddressType,
        taccessNote,
        tlocationName,
        tlocalPhoneNum,
        twhatsPhoneNum,
        tcontactTimes,
        tmomoFullName,
        tmomoPhoneNum,
        tcost,
      ));
      expect(result, equals(Right(tUserRequest)));
    });
  });
}
