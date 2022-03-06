import 'dart:convert';

class Item {
  Item({
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

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
    code: json["id"],
    name: json["material"]["name"],
    price: json["price"],
    cant: json["quantity"],
    //imageUrl: json["imageURL"],
  );

  Map<String, dynamic> toMap() => {
    "id": code,
    "name": name,
    "price": price,
    "quantity": cant,
   // "imageURL": imageUrl,
  };
}
