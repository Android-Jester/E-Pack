import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/server_host.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:e_pack/features/delivery_option/domain/repositories/delivery_request_repo.dart';

class DeliveryRequestRepositoryImpl implements DeliveryRequestRepository {
  final ServerHost serverHost;
  final NetworkInfo networkInfo;

  DeliveryRequestRepositoryImpl(
      {required this.serverHost, required this.networkInfo});

  @override
  // TODO: implement request
  DeliveryRequest get request => throw UnimplementedError();

  @override
  Future<Either<Failure, DeliveryRequest>>? sendDeliveryRequest(
      String? timeCollect,
      String? semesterPeriod,
      int? largeBoxSizeCount,
      int? mediumBoxSizeCount,
      int? smallBoxSizeCount,
      int? relocateInfo,
      String? residenceName,
      String? collectRoomType,
      int? roomNumber,
      String? phoneNumber,
      String? addressType,
      String? accessNote,
      String? destinationAddress,
      int? destinationRoomNumber,
      String? contactName,
      String? contactPhoneNum,
      String? momoFullName,
      String? momoPhoneNum,
      double? cost) async {
    networkInfo.isConnected;
    try {
      final request = await serverHost.sendDeliveryRequest(
          timeCollect,
          semesterPeriod,
          largeBoxSizeCount,
          mediumBoxSizeCount,
          smallBoxSizeCount,
          relocateInfo,
          residenceName,
          collectRoomType,
          roomNumber,
          phoneNumber,
          addressType,
          accessNote,
          destinationAddress,
          destinationRoomNumber,
          contactName,
          contactPhoneNum,
          momoFullName,
          momoPhoneNum,
          cost);
      return Right(request!);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
