import 'dart:convert';

import 'package:e_pack/features/requestBuilder/data/models/user_request_model.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tfirstName = "Kwadwo";
  const tlastName = "Duah";
  const temailAddress = "duah12@outlook.com";
  const tphoneNumber = "0201317498";
  const tlargeBoxSizeCount = 5;
  const tmediumBoxSizeCount = 2;
  const tsmallBoxSizeCount = 1;
  const tlocationName = "Ayduase";
  const tapartmentName = "Whitpam A Hostel";
  const troomNumber = 213;
  const taddress = "Ayduase Gate";
  const tcost = 2550.0;

  final tUserRequestModel = UserRequestModel(
      firstName: tfirstName,
      lastName: tlastName,
      emailAddress: temailAddress,
      phoneNumber: tphoneNumber,
      largeBoxSizeCount: tlargeBoxSizeCount,
      mediumBoxSizeCount: tmediumBoxSizeCount,
      smallBoxSizeCount: tsmallBoxSizeCount,
      locationName: tlocationName,
      apartmentName: tapartmentName,
      roomNumber: troomNumber,
      address: taddress,
      cost: tcost);

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
