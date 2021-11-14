import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/delivery_recepient_info.dart';
import 'package:e_pack/features/log_in/domain/usecases/auth_user.dart';
import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:e_pack/features/storage_option/presentation/provider/storage_recepient_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'features/delivery_option/domain/repositories/delivery_request_repo.dart';
import 'features/log_in/data/datasources/auth_server.dart';
import 'features/log_in/data/repositories/authentication_repo_impl.dart';
import 'features/log_in/domain/repositories/auth_repo.dart';
import 'features/storage_option/data/datasources/server_host.dart';
import 'features/storage_option/domain/repositories/storage_request_repo.dart';
import 'features/storage_option/domain/usecases/send_storage_request.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Provider
  sl.registerFactory(() => DeliveryRecepientInfo());
  sl.registerFactory(() => StorageRecepientInfo());
  // sl.registerFactory(() => AuthenticatingUserInfo());
  // sl.registerFactory(() => RegisteringUserInfo());

  //UseCases
  sl.registerLazySingleton(() => SendDeliveryRequest(sl()));
  sl.registerLazySingleton(() => SendStorageRequest(sl()));
  sl.registerLazySingleton(() => AuthenticatingUser(repo: sl()));
  // sl.registerLazySingleton(() => RegisteringUser(sl()));

//Repository
  sl.registerLazySingleton<DeliveryRequestRepository>(
      () => DeliveryRequestRepositoryImpl(
            serverHost: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<StorageRequestRepository>(
      () => StorageRequestRepositoryImpl(
            serverHost: sl(),
            networkInfo: sl(),
          ));

  sl.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(authServer: sl(), networkInfo: sl()));
  // sl.registerLazySingleton<RegisteringUser>(() => RegisteringUserImpl())

  //DataSources
  sl.registerLazySingleton<DeliveryDataReciever>(
      () => DeliveryDataRecieverImpl());
  sl.registerLazySingleton<StorageDataReceiver>(
      () => StorageDataReceiverImpl());
  sl.registerLazySingleton<AuthServer>(() => AuthServerImpl());

  //core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
