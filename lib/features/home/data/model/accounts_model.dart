import 'package:fundzy/features/home/domain/domain.dart';

class AllAccountModel {
  AllAccountModel({
    required this.data,
  });
  List<AllAccountList> data;

  factory AllAccountModel.fromJson(Map<String, dynamic> json) => AllAccountModel(
        data: List<AllAccountList>.from(
            json["data"].map((x) => AllAccountList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllAccountList extends AllAccountEntity {
  const AllAccountList({
   required String? phoneNumber,
   required dynamic balance,
   required DateTime? created,
  }) : super(phoneNumber: phoneNumber, balance: balance, created: created);

  factory AllAccountList.fromJson(Map<String, dynamic> json) => AllAccountList(
        phoneNumber: json["phoneNumber"],
        balance: json["balance"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "balance": balance,
        "created": created!.toIso8601String(),
      };
}
