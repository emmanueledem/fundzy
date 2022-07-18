// ignore_for_file: overridden_fields, annotate_overrides

import 'package:fundzy/features/auth/auth.dart';

class Userauth extends AuthEntity {
  const Userauth({
    required this.status,
    required this.message,
    required this.data,
  }) : super(message: message, status: status, data: data);

  final String? status;
  final String? message;
  final AuthData? data;

  factory Userauth.fromJson(Map<String, dynamic> json) => Userauth(
        status: json["status"],
        message: json["message"],
        data: AuthData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };     
}

class AuthData {
  AuthData({
    required this.phoneNumber,
    required this.created,
  });

  String? phoneNumber;
  DateTime? created;

  factory AuthData.fromJson(Map<String, dynamic> json) => AuthData(
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "created": created!.toIso8601String(),
      };
}
