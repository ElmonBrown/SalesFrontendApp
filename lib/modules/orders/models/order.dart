import 'dart:convert';

import 'package:multiquimica_store_app/common/models/item.dart';
import 'package:multiquimica_store_app/modules/orders/models/Invoice.dart';

class Order {
  Order({
    this.id,
    this.invoice,
    this.status,
    this.codeSap,
    this.prefereDelivery,
    this.create,
    this.itemAmount,
    this.paymentAmount,
    this.items,
    this.payments,
  });

  String? id;
  Invoice? invoice;
  int? status;
  dynamic codeSap;
  DateTime? prefereDelivery;
  DateTime? create;
  int? itemAmount;
  int? paymentAmount;
  List<Item>? items;
  List<dynamic>? payments;

  factory Order.fromJson(String str) => Order.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Order.fromMap(Map<String, dynamic> json) => Order(
    id: json["id"] == null ? null : json["id"],
    invoice: json["invoice"] == null ? null : Invoice.fromMap(json["invoice"]),
    status: json["status"] == null ? null : json["status"],
    codeSap: json["codeSAP"],
    prefereDelivery: json["prefereDelivery"] == null ? null : DateTime.parse(json["prefereDelivery"]),
    create: json["create"] == null ? null : DateTime.parse(json["create"]),
    itemAmount: json["itemAmount"] == null ? null : json["itemAmount"],
    paymentAmount: json["paymentAmount"] == null ? null : json["paymentAmount"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
    payments: json["payments"] == null ? null : List<dynamic>.from(json["payments"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "invoice": invoice == null ? null : invoice?.toMap(),
    "status": status == null ? null : status,
    "codeSAP": codeSap,
    "prefereDelivery": prefereDelivery == null ? null : prefereDelivery?.toIso8601String(),
    "create": create == null ? null : create?.toIso8601String(),
    "itemAmount": itemAmount == null ? null : itemAmount,
    "paymentAmount": paymentAmount == null ? null : paymentAmount,
    "items": items == null ? null : List<dynamic>.from(items!.map((x) => x.toMap())),
    "payments": payments == null ? null : List<dynamic>.from(payments!.map((x) => x)),
  };
}


