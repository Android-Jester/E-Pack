import 'package:e_pack/features/e-pack/domain/entities/boxCount.dart';
import 'package:e_pack/features/e-pack/domain/entities/deliveryInfo.dart';
import 'package:e_pack/features/e-pack/domain/entities/userAccount.dart';
import 'package:equatable/equatable.dart';
import 'accessInfo.dart';
import 'personalInfo.dart';


// ignore: must_be_immutable
class UserRequest extends Equatable {
    late final PersonalInfo person;
    late final DeliveryInfo delivery;
    late final UserAccount account;
    late final BoxCount boxes;
    late final AccessInfo accessInfo;

  @override
  // TODO: implement props
  List<Object?> get props => [];}