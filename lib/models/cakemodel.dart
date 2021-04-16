// To parse this JSON data, do
//
//     final cake = cakeFromJson(jsonString);

import 'dart:convert';

List<Cake> cakeFromJson(String str) =>
    List<Cake>.from(json.decode(str).map((x) => Cake.fromJson(x)));

String cakeToJson(List<Cake> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cake {
  Cake({
    this.id,
    this.name,
    this.type,
    this.price,
    this.deliveryType,
    this.image,
    this.bakery,
  });

  String id;
  String name;
  String type;
  int price;
  String deliveryType;
  String image;
  String bakery;

  factory Cake.fromJson(Map<String, dynamic> json) => Cake(
        id: json["_id"],
        name: json["name"],
        type: json["type"],
        price: json["price"],
        deliveryType: json["deliveryType"],
        image: json["image"],
        bakery: json["bakery"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "type": type,
        "price": price,
        "deliveryType": deliveryType,
        "image": image,
        "bakery": bakery,
      };
}
