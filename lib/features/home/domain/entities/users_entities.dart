import 'package:equatable/equatable.dart';

class AllUsersEntity extends Equatable {
  const AllUsersEntity({
    required this.phoneNumber,
    required this.balance,
    required this.created,
  });
 final String? phoneNumber;
 final  dynamic balance;
 final DateTime? created;
  
  @override
  List<Object?> get props => [phoneNumber, balance, created];


}
