// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);
import 'dart:convert';

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == "" ? null : json["id"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "email": email == null ? null : email,
      };
}
