import 'package:fundzy/features/features.dart';

class TransactionModel {
  TransactionModel({
    required this.data,
  });

  final List<TransactionList> data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        data: List<TransactionList>.from(
            json["data"].map((x) => TransactionList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class TransactionList extends TransactionEntity {
  const TransactionList({
    required String? type,
    required dynamic amount,
    required String? phoneNumber,
    required dynamic balance,
    required DateTime? created,
  }) : super(
            type: type,
            amount: amount,
            phoneNumber: phoneNumber,
            balance: balance,
            created: created);

  factory TransactionList.fromJson(Map<String, dynamic> json) =>
      TransactionList(
        type: json["type"],
        amount: json["amount"],
        phoneNumber: json["phoneNumber"],
        created: DateTime.parse(json["created"]),
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "amount": amount,
        "phoneNumber": phoneNumber,
        "created": created!.toIso8601String(),
        "balance": balance,
      };
}
