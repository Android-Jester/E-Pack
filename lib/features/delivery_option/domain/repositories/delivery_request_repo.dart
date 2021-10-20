import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';

abstract class DeliveryRequestRepository {
  final DeliveryRequest request;
  DeliveryRequestRepository({required this.request});

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
    double? cost,
  );
}
