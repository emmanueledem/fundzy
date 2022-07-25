import 'package:equatable/equatable.dart';

class WithdrawalEntity extends Equatable {
  const WithdrawalEntity({
    required this.status,
    required this.message,
    required this.data,
  });

  final dynamic status;
  final dynamic message;
  final dynamic data;

  @override
  List<Object?> get props => [status, message, data];
}
