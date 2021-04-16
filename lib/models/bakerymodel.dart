// To parse this JSON data, do
//
//     final bakery = bakeryFromJson(jsonString);

import 'dart:convert';

List<Bakery> bakeryFromJson(String str) =>
    List<Bakery>.from(json.decode(str).map((x) => Bakery.fromJson(x)));

String bakeryToJson(List<Bakery> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bakery {
  Bakery({
    this.cakes,
    this.id,
    this.name,
    this.contact,
    this.address,
    this.deliveryBoy,
    this.open,
    this.close,
  });

  List<dynamic> cakes;
  String id;
  String name;
  int contact;
  String address;
  String deliveryBoy;
  String open;
  String close;

  factory Bakery.fromJson(Map<String, dynamic> json) => Bakery(
        cakes: List<dynamic>.from(json["cakes"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        contact: json["contact"] == null ? null : json["contact"],
        address: json["address"],
        deliveryBoy: json["delivery_boy"],
        open: json["open"],
        close: json["close"],
      );

  Map<String, dynamic> toJson() => {
        "cakes": List<dynamic>.from(cakes.map((x) => x)),
        "_id": id,
        "name": name,
        "contact": contact == null ? null : contact,
        "address": address,
        "delivery_boy": deliveryBoy,
        "open": open,
        "close": close,
      };
}
