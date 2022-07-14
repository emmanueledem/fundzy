class Userauth {
    Userauth({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    String? message;
    AuthData? data;

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
        this.phoneNumber,
        this.created,
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
