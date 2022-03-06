import 'dart:convert';

class Presentation {
  Presentation({
    this.name,
    this.code,
    this.pesoKg,
    this.stock,
  });

  String? name;
  String? code;
  int? pesoKg;
  int? stock;

  factory Presentation.fromJson(String str) => Presentation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Presentation.fromMap(Map<String, dynamic>? json) => Presentation(
    name: json?["name"],
    code: json?["code"],
    pesoKg: json?["pesoKg"],
    stock: json?["stock"],
  );

  Map<String, dynamic> toMap() => {
    "name": name,
    "code": code,
    "pesoKg": pesoKg,
    "stock": stock,
  };
}
