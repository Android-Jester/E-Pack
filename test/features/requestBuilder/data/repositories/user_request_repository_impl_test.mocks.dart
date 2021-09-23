// Mocks generated by Mockito 5.0.16 from annotations
// in e_pack/test/features/requestBuilder/data/repositories/user_request_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;

import 'package:e_pack/core/network/network_info.dart' as _i3;
import 'package:e_pack/features/requestBuilder/data/datasources/server_host.dart'
    as _i2;
import 'package:e_pack/features/requestBuilder/data/repositories/user_request_repo_impl.dart'
    as _i5;
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeServerHost_0 extends _i1.Fake implements _i2.ServerHost {}

class _FakeNetworkInfo_1 extends _i1.Fake implements _i3.NetworkInfo {}

class _FakeUserRequest_2 extends _i1.Fake implements _i4.UserRequest {}

/// A class which mocks [ServerHost].
///
/// See the documentation for Mockito's code generation for more information.
class MockServerHost extends _i1.Mock implements _i2.ServerHost {
  MockServerHost() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String toString() => super.toString();
}

/// A class which mocks [UserRequestRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRequestRepositoryImpl extends _i1.Mock
    implements _i5.UserRequestRepositoryImpl {
  MockUserRequestRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ServerHost get serverHost =>
      (super.noSuchMethod(Invocation.getter(#serverHost),
          returnValue: _FakeServerHost_0()) as _i2.ServerHost);
  @override
  _i3.NetworkInfo get networkInfo =>
      (super.noSuchMethod(Invocation.getter(#networkInfo),
          returnValue: _FakeNetworkInfo_1()) as _i3.NetworkInfo);
  @override
  _i4.UserRequest get request =>
      (super.noSuchMethod(Invocation.getter(#request),
          returnValue: _FakeUserRequest_2()) as _i4.UserRequest);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i3.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  String toString() => super.toString();
}
