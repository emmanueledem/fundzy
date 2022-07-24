import 'package:fundzy/features/withdraw/domain/entities/entities.dart';

class WithdrawalModel extends WithdrawalEntity {
  const WithdrawalModel({
    required status,
    required message,
    required data,
  }) : super(status: status, message: data, data: data);

  factory WithdrawalModel.fromJson(Map<String, dynamic> json) =>
      WithdrawalModel(
        status: json["status"],
        message: json["message"],
        data: WithdrawalData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class WithdrawalData {
  WithdrawalData({
    this.withdrawal,
  });
  int? withdrawal;
  factory WithdrawalData.fromJson(Map<String, dynamic> json) => WithdrawalData(
        withdrawal: json["withdrawal"],
      );

  Map<String, dynamic> toJson() => {
        "withdrawal": withdrawal,
      };
}
