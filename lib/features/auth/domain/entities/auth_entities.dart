import 'package:equatable/equatable.dart';
import 'package:fundzy/features/auth/data/data.dart';

class AuthEntity extends Equatable {
  final String? status;
  final String? message;
  final AuthData? data;

  const AuthEntity({required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}
