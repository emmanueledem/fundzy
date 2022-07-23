import 'package:fundzy/features/transfer/domain/domain.dart';

class TransferModel extends TransferEntity {
  const TransferModel({
    required status,
    required message,
    required data,
  }) : super(status: status, message: message, data: data);

  factory TransferModel.fromJson(Map<String, dynamic> json) => TransferModel(
        status: json["status"],
        message: json["message"],
        data: TransferData.fromJson(json["data"]),
      );
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class TransferData {
  TransferData({
    this.sent,
  });
  int? sent;
  factory TransferData.fromJson(Map<String, dynamic> json) => TransferData(
        sent: json["sent"],
      );

  Map<String, dynamic> toJson() => {
        "sent": sent,
      };
}
