import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/core_errors/failures.dart';
import '../../../../core/core_usage/classes/usecase.dart';
import '../entities/response.dart';
import '../repositories/delivery_request_repo.dart';

class SendDeliveryRequest extends UseCase<DeliveryResponse, Params> {
  final DeliveryRequestRepository repo;

  SendDeliveryRequest({required this.repo});

  @override
  Future<Either<Failure, DeliveryResponse>> call({required Params params}) async {
    return repo.sendDeliveryRequest(
      // Time Collection
      timeCollect: params.timeCollect,

      //Box Sizes
      largeBoxSizeCount: params.largeBoxSizeCount,
      mediumBoxSizeCount: params.mediumBoxSizeCount,
      smallBoxSizeCount: params.smallBoxSizeCount,

      //relocation Information
      relocateInfo: params.relocateInfo,

      // Collection Location Info
      residenceName: params.residenceName,
      collectRoomType: params.collectRoomType,
      roomNumber: params.roomNumber,
      phoneNumber: params.phoneNumber,
      addressType: params.addressType,
      accessNote: params.accessNote,

      // Destination Information
      destinationAddress: params.destinationAddress,
      destinationRoomNumber: params.destinationRoomNumber,
      contactName: params.contactName,
      contactPhoneNum: params.contactPhoneNum,

      //Payment Details
      momoFullName: params.momoFullName,
      momoPhoneNum: params.momoPhoneNum,
      cost: params.cost,
    );
  }
}

class Params extends Equatable {
  final String timeCollect;
  final String collectRoomType;
  final int largeBoxSizeCount, mediumBoxSizeCount, smallBoxSizeCount;
  final int relocateInfo;
  final String residenceName;
  final String roomNumber;
  final String phoneNumber;
  final String addressType;
  final String accessNote;
  final String destinationAddress;
  final String destinationRoomNumber;
  final String contactName, contactPhoneNum;
  final String momoFullName, momoPhoneNum;
  final double cost;

  Params({
    // Time Collection
    required this.timeCollect,

    //Box Sizes
    required this.largeBoxSizeCount,
    required this.mediumBoxSizeCount,
    required this.smallBoxSizeCount,

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
