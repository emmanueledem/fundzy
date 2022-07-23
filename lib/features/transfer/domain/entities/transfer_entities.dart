import 'package:equatable/equatable.dart';
import 'package:fundzy/features/transfer/data/data.dart';

class TransferEntity extends Equatable {
  final String? status;
  final String? message;
  final TransferData? data;

  const TransferEntity({required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}
