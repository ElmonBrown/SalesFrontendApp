import 'dart:convert';

class Product {
  Product({
    required this.code,
    this.name :'Product 00',
    this.price: 0,
    this.cant: 0,
    this.imageUrl,
  });

  String code;
  String name;
  int price;
  int cant;
  String? imageUrl;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    code: json["code"],
    name: json["name"],
    price: json["price"],
    imageUrl: json["imageURL"],
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "name": name,
    "price": price,
    "imageURL": imageUrl,
  };
}
