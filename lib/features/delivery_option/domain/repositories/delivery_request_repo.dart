import 'package:dartz/dartz.dart';
import '../../../../core/core_errors/failures.dart';
import '../entities/response.dart';

abstract class DeliveryRequestRepository {
  String username = "";

  Future<Either<Failure, DeliveryResponse>> sendDeliveryRequest({
    required String timeCollect,
    required int largeBoxSizeCount,
    required int mediumBoxSizeCount,
    required int smallBoxSizeCount,
    required int relocateInfo,
    required String residenceName,
    required String collectRoomType,
    required String roomNumber,
    required String phoneNumber,
    required String addressType,
    String? accessNote,
    String? destinationAddress,
    String? destinationRoomNumber,
    String? contactName,
    String? contactPhoneNum,
    required String momoFullName,
    required String momoPhoneNum,
    required double cost,
  });
}
