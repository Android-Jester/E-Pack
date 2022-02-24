import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/remote/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/sign_up/data/repositories/registration_repo_impl.dart';
import 'package:e_pack/features/storage_option/data/datasources/storage_data_receiver.dart';
import 'package:e_pack/features/storage_option/data/repositories/storage_request_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'features/log_in/data/datasources/remote/auth_server.dart';
import 'features/log_in/data/repositories/authentication_repo_impl.dart';
import 'features/sign_up/data/datasources/register_server.dart';

class Dependency extends ChangeNotifier {
  // Core
  NetworkInfoImpl networkInfo = NetworkInfoImpl(InternetConnectionChecker());

  // Delivery Repository
  late DeliveryDataRecieverImpl deliveryServerHost;
  late DeliveryRequestRepositoryImpl repositoryImpl = DeliveryRequestRepositoryImpl(networkInfo: networkInfo, serverHost: deliveryServerHost);

  // Storage Repository
  late StorageDataReceiverImpl storageServerHost;
  late StorageRequestRepositoryImpl storageRepo = StorageRequestRepositoryImpl(serverHost: storageServerHost);

  // Login Model
  late AuthServerImpl authServer;
  late AuthRepoImpl authRepo = AuthRepoImpl(server: authServer, networkInfo: networkInfo);

  // SignUp Model
  late RegisterServerImpl registerServer;
  late RegisterRepoImpl regRepo = RegisterRepoImpl(networkInfo: networkInfo, authServer: registerServer);
}
