import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';
import 'package:e_pack/features/sign_up/data/repositories/registration_repo_impl.dart';
import 'package:e_pack/features/sign_up/domain/repositories/registering_user_repo.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:e_pack/features/storage_option/domain/usecases/send_storage_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/delivery_option/domain/repositories/delivery_request_repo.dart';
import 'features/log_in/data/datasources/auth_server.dart';
import 'features/log_in/data/repositories/authentication_repo_impl.dart';
import 'features/sign_up/data/datasources/register_server.dart';
import 'features/storage_option/domain/repositories/storage_request_repo.dart';

// class Dependency extends ChangeNotifier {
//   // Core
//   NetworkInfoImpl networkInfo = NetworkInfoImpl(InternetConnectionChecker());
//
//   // Delivery Repository
//   late DeliveryDataRecieverImpl deliveryServerHost;
//   late DeliveryRequestRepositoryImpl repositoryImpl = DeliveryRequestRepositoryImpl(networkInfo: networkInfo, serverHost: deliveryServerHost);
//
//   // Storage Repository
//   late StorageDataReceiverImpl storageServerHost;
//   late StorageRequestRepositoryImpl storageRepo = StorageRequestRepositoryImpl(serverHost: storageServerHost);
//
//   // Login Model
//   late AuthServerImpl authServer;
//   late AuthRepoImpl authRepo = AuthRepoImpl(server: authServer, networkInfo: networkInfo);
//
//   // SignUp Model
//   late RegisterServerImpl registerServer;
//   late RegisterRepoImpl regRepo = RegisterRepoImpl(networkInfo: networkInfo, authServer: registerServer);
// }

final locator = GetIt.instance;

Future<void> start() async {
  locator.registerFactory<DeliveryCubit>(() => DeliveryCubit(deliveryRequest: locator.get<SendDeliveryRequest>()));
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator.get<InternetConnectionChecker>()));
  locator.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker());

  locator.registerLazySingleton<AuthServer>(() => AuthServerImpl());
  locator.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(
        networkInfo: locator.get<NetworkInfo>(),
        server: locator.get<AuthServer>(),
      ));

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
