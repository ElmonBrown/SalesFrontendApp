import 'dart:convert';
class Invoice {
  Invoice({
    this.codeSap,
    this.fiscalNumber,
  });

  String? codeSap;
  String? fiscalNumber;

  factory Invoice.fromJson(String str) => Invoice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Invoice.fromMap(Map<String, dynamic> json) => Invoice(
    codeSap: json["codeSAP"] == null ? null : json["codeSAP"],
    fiscalNumber: json["fiscalNumber"] == null ? null : json["fiscalNumber"],
  );

  Map<String, dynamic> toMap() => {
    "codeSAP": codeSap == null ? null : codeSap,
    "fiscalNumber": fiscalNumber == null ? null : fiscalNumber,
  };
}