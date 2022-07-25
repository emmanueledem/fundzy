import 'package:fundzy/features/home/domain/domain.dart';

class AllUsersModel {
  AllUsersModel({
    required this.data,
  });
  List<AllUsersList> data;

  factory AllUsersModel.fromJson(Map<String, dynamic> json) => AllUsersModel(
        data: List<AllUsersList>.from(
            json["data"].map((x) => AllUsersList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AllUsersList extends AllUsersEntity {
  const AllUsersList({
    required String? phoneNumber,
    required dynamic balance,
    required DateTime? created,
  }) : super(phoneNumber: phoneNumber, balance: balance, created: created);

  factory AllUsersList.fromJson(Map<String, dynamic> json) => AllUsersList(
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
