// Mocks generated by Mockito 5.0.16 from annotations
// in e_pack/test/features/requestBuilder/domain/usecases/send_user_request_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:e_pack/core/Failure/failures.dart' as _i6;
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart' as _i2;
import 'package:e_pack/features/requestBuilder/domain/repositories/user_request_repo.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUserRequest_0 extends _i1.Fake implements _i2.UserRequest {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [UserRequestRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRequestRepository extends _i1.Mock implements _i4.UserRequestRepository {
  MockUserRequestRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.UserRequest get request =>
      (super.noSuchMethod(Invocation.getter(#request), returnValue: _FakeUserRequest_0())
          as _i2.UserRequest);
  @override
  _i5.Future<_i3.Either<_i6.Failure, _i2.UserRequest>> sendUserRequest(
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
          double? cost) =>
      (super.noSuchMethod(
              Invocation.method(#sendUserRequest, [
                firstName,
                lastName,
                emailAddress,
                phoneNumber,
                largeBoxSizeCount,
                mediumBoxSizeCount,
                smallBoxSizeCount,
                locationName,
                apartmentName,
                roomNumber,
                address,
                cost
              ]),
              returnValue: Future<_i3.Either<_i6.Failure, _i2.UserRequest>>.value(
                  _FakeEither_1<_i6.Failure, _i2.UserRequest>()))
          as _i5.Future<_i3.Either<_i6.Failure, _i2.UserRequest>>);
  @override
  String toString() => super.toString();
}