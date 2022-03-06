import 'dart:convert';

import 'package:multiquimica_store_app/modules/catalogue/models/presentation.dart';

import 'category.dart';

class Product {
  Product({
    required this.code,
    required this.name,
    this.description,
    this.category,
    this.presentations,
    required this.price,
    this.currency,
    this.cant,
  });

  String code;
  String name;
  String? description;
  Category? category;
  List<Presentation>? presentations;
  int price;
  String? currency;
  int? cant;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    code: json["code"],
    name: json["name"],
    description: json["description"],
    category: Category.fromMap(json["category"]),
    presentations: json["presentations"] == null ? null : List<Presentation>.from(json["presentations"].map((x) => Presentation.fromMap(x))),
    price: json["price"],
    currency: json["currency"],
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "name": name,
    "description": description,
    "category": category?.toMap(),
    "presentations": List<dynamic>.from(presentations!.map((x) => x.toMap())),
    "price": price,
    "currency": currency,
  };
}
