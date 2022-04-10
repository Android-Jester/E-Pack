import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';
import 'package:e_pack/features/log_in/domain/usecases/auth_user.dart';
import 'package:e_pack/features/log_in/presentation/provider/login_cubit.dart';
import 'package:e_pack/features/sign_up/data/repositories/registration_repo_impl.dart';
import 'package:e_pack/features/sign_up/domain/repositories/registering_user_repo.dart';
import 'package:e_pack/features/sign_up/presentation/provider/sign_up_cubit.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:e_pack/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/delivery_option/domain/repositories/delivery_request_repo.dart';
import 'features/log_in/data/datasources/auth_server.dart';
import 'features/log_in/data/datasources/local_auth_server.dart';
import 'features/log_in/data/repositories/authentication_repo_impl.dart';
import 'features/sign_up/data/datasources/register_server.dart';
import 'features/storage_option/domain/repositories/storage_request_repo.dart';
import 'features/storage_option/presentation/provider/bloc/storage_cubit.dart';

final locator = GetIt.instance;

Future<void> start() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  locator.registerFactory<DeliveryCubit>(() => DeliveryCubit(deliveryRequest: locator.get<SendDeliveryRequest>()));
  locator.registerFactory<SignUpCubit>(() => SignUpCubit());
  locator.registerFactory<LoginCubit>(() => LoginCubit(authUser: locator.get<AuthenticatingUser>()));
  locator.registerFactory<StorageCubit>(() => StorageCubit());
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator.get<InternetConnectionChecker>()));
  locator.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());
  locator.registerLazySingleton<LoginServer>(() => LoginServerImpl());
  locator.registerLazySingleton<LocalLoginServer>(() => LocalLoginServerImpl(sharedPreferences: sharedPreferences));
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        networkInfo: locator.get<NetworkInfo>(),
        server: locator.get<LoginServer>(),
        localServer: locator.get<LocalLoginServer>(),
      ));
  locator.registerLazySingleton<AuthenticatingUser>(() => AuthenticatingUser(repo: locator.get<AuthRepo>()));

  locator.registerLazySingleton<RegisterServer>(() => RegisterServerImpl());
  locator.registerLazySingleton<RegisterRepo>(() => RegisterRepoImpl(
        networkInfo: locator.get<NetworkInfo>(),
        authServer: locator.get<RegisterServer>(),
      ));

  locator.registerLazySingleton<DeliveryDataReciever>(() => DeliveryDataRecieverImpl(
    username: (locator.get<RegisterRepo>().username == "") ? locator.get<AuthRepo>().username :  locator.get<RegisterRepo>().username,
  ));
  locator.registerLazySingleton<StorageDataReceiver>(() => StorageDataReceiverImpl());
  locator.registerLazySingleton<StorageRequestRepository>(() => StorageRequestRepositoryImpl(
        serverHost: locator.get<StorageDataReceiver>(),
      ));
  locator.registerLazySingleton<DeliveryRequestRepository>(() => DeliveryRequestRepositoryImpl(
        serverHost: locator.get<DeliveryDataReciever>(),
        networkInfo: locator.get<NetworkInfo>(),
        username: locator.get<String>(),
      ));
  locator.registerLazySingleton<SendDeliveryRequest>(() => SendDeliveryRequest(repo: locator.get<DeliveryRequestRepository>()));
  locator.registerLazySingleton<SendStorageRequest>(() => SendStorageRequest(locator.get<StorageRequestRepository>()));
}
