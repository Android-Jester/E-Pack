import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/UseCase/usecase.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:e_pack/features/delivery_option/domain/repositories/delivery_request_repo.dart';
import 'package:equatable/equatable.dart';

class SendDeliveryRequest extends UseCase<DeliveryRequest, Params> {
  final DeliveryRequestRepository? repo;

  SendDeliveryRequest(this.repo);

  @override
  Future<Either<Failure, DeliveryRequest>?>? call(Params params) async {
    return await repo!.sendDeliveryRequest(
      // Time Collection
      params.timeCollect,
      params.semesterPeriod,

      //Box Sizes
      params.largeBoxSizeCount,
      params.mediumBoxSizeCount,
      params.smallBoxSizeCount,

      //relocation Information
      params.relocateInfo,

      // Collection Location Info
      params.residenceName,
      params.collectRoomType,
      params.roomNumber,
      params.phoneNumber,
      params.addressType,
      params.accessNote,

      // Destination Information
      params.destinationAddress,
      params.destinationRoomNumber,
      params.contactName,
      params.contactPhoneNum,

      //Payment Details
      params.momoFullName,
      params.momoPhoneNum,
      params.cost,
    );
  }
}

// }
//
class Params extends Equatable {
  final String? timeCollect, semesterPeriod, collectRoomType;
  final int? largeBoxSizeCount, mediumBoxSizeCount, smallBoxSizeCount;
  final int? relocateInfo;
  final String? residenceName;
  final int? roomNumber;
  final String? phoneNumber;
  final String? addressType;
  final String? accessNote;
  final String? destinationAddress;
  final int? destinationRoomNumber;
  final String? contactName, contactPhoneNum;
  final String? momoFullName, momoPhoneNum;
  final double? cost;

  Params({
    // Time Collection
    required this.timeCollect,
    required this.semesterPeriod,

    //Box Sizes
    this.largeBoxSizeCount,
    this.mediumBoxSizeCount,
    this.smallBoxSizeCount,

    //relocation Information
    required this.relocateInfo,

    // Collection Location Info
    required this.residenceName,
    required this.collectRoomType,
    required this.roomNumber,
    required this.phoneNumber,
    required this.addressType,
    required this.accessNote,

    // Destination Information
    required this.destinationAddress,
    required this.destinationRoomNumber,
    required this.contactName,
    required this.contactPhoneNum,

    //Payment Details
    required this.momoFullName,
    required this.momoPhoneNum,
    required this.cost,
  });

  @override
  List<Object?> get props => [
        // Time Collection
        timeCollect,
        semesterPeriod,

        //Box Sizes
        largeBoxSizeCount,
        mediumBoxSizeCount,
        smallBoxSizeCount,

        //relocation Information
        relocateInfo,

        // Collection Location Info
        residenceName,
        collectRoomType,
        roomNumber,
        phoneNumber,
        addressType,
        accessNote,

        // Destination Information
        destinationAddress,
        destinationRoomNumber,
        contactName,
        contactPhoneNum,

        //Payment Details
        momoFullName,
        momoPhoneNum,
        cost,
      ];
}
