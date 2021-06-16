import 'package:equatable/equatable.dart';

class UserAccount extends Equatable{

  final String userName, firstName, lastName, emailAddress, passcode;
  UserAccount({required this.firstName,required this.lastName,required  this.emailAddress,  required this.passcode, required this.userName,});

  @override
  List<Object?> get props => [userName, firstName, lastName, emailAddress, passcode];
}
