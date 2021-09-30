import 'dart:convert';

class LoginModel {
  LoginModel({
    required this.user,
    required this.password,
  });

  String user;
  String password;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    user: json["user"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "user": user,
    "password": password,
  };
}
