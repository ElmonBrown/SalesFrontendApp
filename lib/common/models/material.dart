import 'dart:convert';

import 'package:multiquimica_store_app/modules/catalogue/models/category.dart';
import 'package:multiquimica_store_app/modules/catalogue/models/presentation.dart';

//ESTTA CLASE DEBE COMBINARSE CON LA CLASE PRODUCT
class Material {
  Material({
    this.code,
    this.name,
    this.description,
    this.presentation,
    this.category,
  });

  String? code;
  String? name;
  String? description;
  Presentation? presentation;
  Category? category;

  factory Material.fromJson(String str) => Material.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Material.fromMap(Map<String, dynamic> json) => Material(
    code: json["code"] == null ? null : json["code"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    presentation: json["presentation"] == null ? null : Presentation.fromMap(json["presentation"]),
    category: json["category"] == null ? null : Category.fromMap(json["category"]),
  );

  Map<String, dynamic> toMap() => {
    "code": code == null ? null : code,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "presentation": presentation == null ? null : presentation?.toMap(),
    "category": category == null ? null : category?.toMap(),
  };
}