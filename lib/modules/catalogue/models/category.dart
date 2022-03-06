import 'dart:convert';

class Category {
  Category({
     this.id,
     this.name,
     this.nivel,
  });

  String? id;
  String? name;
  int? nivel;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic>? json) => Category(
    id: json?["id"],
    name: json?["name"],
    nivel: json?["nivel"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "nivel": nivel,
  };
}