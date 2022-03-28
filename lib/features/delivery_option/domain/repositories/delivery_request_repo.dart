import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';

import '../entities/response.dart';

abstract class DeliveryRequestRepository {
  final String username = "";

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
