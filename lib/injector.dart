import 'dart:io';

import 'package:e_pack_final/core/core_usage/network.dart';
import 'package:e_pack_final/features/log_in/presentation/provider/login_cubit.dart';
import 'package:e_pack_final/features/sign_up/data/datasources/local_register_server.dart';
import 'package:e_pack_final/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/log_in/data/datasources/auth_server.dart';
import 'features/log_in/data/datasources/local_auth_server.dart';
import 'features/log_in/data/repositories/authentication_repo_impl.dart';
import 'features/log_in/domain/repositories/auth_repo.dart';
import 'features/log_in/domain/usecases/auth_user.dart';
import 'features/sign_up/data/datasources/register_server.dart';
import 'features/sign_up/data/repositories/registration_repo_impl.dart';
import 'features/sign_up/domain/repositories/registering_user_repo.dart';
import 'features/sign_up/domain/usecases/register_user.dart';
import 'features/sign_up/presentation/provider/sign_up_cubit.dart';
import 'features/storage_option/data/datasources/storage_data_receiver.dart';
import 'features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'features/storage_option/domain/repositories/storage_request_repo.dart';
import 'features/storage_option/presentation/provider/bloc/storage_cubit.dart';

final locator = GetIt.instance;


Future<void> start() async {
  //core
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences shared = await SharedPreferences.getInstance();
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));



// SignUp User
  locator.registerFactory<SignUpCubit>(() => SignUpCubit(signUpUser: locator.get<RegisteringUser>()));

  locator.registerLazySingleton<LocalRegisterServer>(() => LocalRegisterServerImpl(sharedPreferences: shared));
  locator.registerLazySingleton<RegisterServer>(() => RegisterServerImpl());

  locator.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(
      webServer: locator.get<RegisterServer>(),
      localServer: locator.get<LocalRegisterServer>(),
      networkInfo: locator.get<NetworkInfo>(),
  ));
  locator.registerLazySingleton<RegisteringUser>(() => RegisteringUser(repo: locator.get<RegisterRepo>()));

// Login User
  locator.registerFactory<LoginCubit>(() => LoginCubit(authUser: locator.get<AuthenticatingUser>()));

  locator.registerLazySingleton<LocalLoginServer>(() => LocalLoginServerImpl(sharedPreferences: shared));
  locator.registerLazySingleton<LoginServer>(() => LoginServerImpl());

  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
    webServer: locator.get<LoginServer>(),
    localServer: locator.get<LocalLoginServer>(),
    networkInfo: locator.get<NetworkInfo>(),
  ));
  locator.registerLazySingleton<AuthenticatingUser>(() => AuthenticatingUser(repo: locator.get<AuthRepo>()));

  // storage option
  locator.registerFactory<StorageCubit>(() => StorageCubit(sendStorageData: locator.get<SendStorageRequest>()));

  locator.registerLazySingleton<StorageDataReceiver>(() => StorageDataReceiverImpl());

  locator.registerLazySingleton<StorageRequestRepository>(() => StorageRequestRepositoryImpl(serverHost: locator.get<StorageDataReceiver>()));
  locator.registerLazySingleton<SendStorageRequest>(() => SendStorageRequest(locator.get<StorageRequestRepository>()));

}