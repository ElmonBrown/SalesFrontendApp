import 'dart:convert';

import 'package:multiquimica_store_app/common/models/material.dart';

class Item {
  Item({
    this.id,
    this.material,
    this.quantity,
    this.currency,
    this.originalPrice,
    this.discount,
    this.price,
    this.amount,
  });

  String? id;
  Material? material;
  int? quantity;
  String? currency;
  int? originalPrice;
  int? discount;
  int? price;
  int? amount;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    id: json["id"] == null ? null : json["id"],
    material: json["material"] == null ? null : Material.fromMap(json["material"]),
    quantity: json["quantity"] == null ? null : json["quantity"],
    currency: json["currency"] == null ? null : json["currency"],
    originalPrice: json["originalPrice"] == null ? null : json["originalPrice"],
    discount: json["discount"] == null ? null : json["discount"],
    price: json["price"] == null ? null : json["price"],
    amount: json["amount"] == null ? null : json["amount"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "material": material == null ? null : material?.toMap(),
    "quantity": quantity == null ? null : quantity,
    "currency": currency == null ? null : currency,
    "originalPrice": originalPrice == null ? null : originalPrice,
    "discount": discount == null ? null : discount,
    "price": price == null ? null : price,
    "amount": amount == null ? null : amount,
  };
}
