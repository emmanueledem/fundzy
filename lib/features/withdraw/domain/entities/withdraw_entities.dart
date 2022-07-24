import 'package:equatable/equatable.dart';
import 'package:fundzy/features/withdraw/data/model/model.dart';

class WithdrawalEntity extends Equatable {
  const WithdrawalEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  final String? status;
  final String? message;
  final WithdrawalData? data;

  @override
  List<Object?> get props => [status, message, data];
}
