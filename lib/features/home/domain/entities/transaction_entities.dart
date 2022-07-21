import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String? type;
  final int? amount;
  final dynamic balance;
  final DateTime? created;
  final String? phoneNumber;

  const TransactionEntity({
    required this.type,
    required this.amount,
    required this.balance,
    required this.created,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [type, amount, balance, created, phoneNumber];
}
