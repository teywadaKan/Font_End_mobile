// To parse this JSON data, do
//
//     final sushiModel = sushiModelFromJson(jsonString);

import 'dart:convert';

List<SushiModel> sushiModelFromJson(String str) =>
    List<SushiModel>.from(json.decode(str).map((x) => SushiModel.fromJson(x)));

String sushiModelToJson(List<SushiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SushiModel {
  int id;
  String type;
  String image;
  String name;
  int price;

  SushiModel({
    required this.id,
    required this.type,
    required this.image,
    required this.name,
    required this.price,
  });

  factory SushiModel.fromJson(Map<String, dynamic> json) => SushiModel(
        id: json["id"],
        type: json["type"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "image": image,
        "name": name,
        "price": price,
      };
}
