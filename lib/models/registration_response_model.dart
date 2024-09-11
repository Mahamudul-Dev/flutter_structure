// To parse this JSON data, do
//
//     final registrationResponseModel = registrationResponseModelFromJson(jsonString);

import 'dart:convert';

RegistrationResponseModel registrationResponseModelFromJson(String str) => RegistrationResponseModel.fromJson(json.decode(str));

String registrationResponseModelToJson(RegistrationResponseModel data) => json.encode(data.toJson());

class RegistrationResponseModel {
    String message;
    User? user;
    String token;

    RegistrationResponseModel({
        required this.message,
        required this.user,
        required this.token,
    });

    factory RegistrationResponseModel.fromJson(Map<String, dynamic> json) => RegistrationResponseModel(
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "user": user?.toJson(),
        "token": token,
    };
}

class User {
    String name;
    String email;
    String password;
    String role;
    bool isActive;
    bool verified;
    bool blocked;
    List<dynamic> wishlist;
    String id;
    List<dynamic> addresses;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    User({
        required this.name,
        required this.email,
        required this.password,
        required this.role,
        required this.isActive,
        required this.verified,
        required this.blocked,
        required this.wishlist,
        required this.id,
        required this.addresses,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        isActive: json["isActive"],
        verified: json["verified"],
        blocked: json["blocked"],
        wishlist: List<dynamic>.from(json["wishlist"].map((x) => x)),
        id: json["_id"],
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "role": role,
        "isActive": isActive,
        "verified": verified,
        "blocked": blocked,
        "wishlist": List<dynamic>.from(wishlist.map((x) => x)),
        "_id": id,
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}
