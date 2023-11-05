// To parse this JSON data, do
//
//     final addCartModel = addCartModelFromJson(jsonString);

import 'dart:convert';

AddCartModel addCartModelFromJson(String str) =>
    AddCartModel.fromJson(json.decode(str));

String addCartModelToJson(AddCartModel data) => json.encode(data.toJson());

class AddCartModel {
  int uid;
  int sushiId;
  int amount;
  String status;

  AddCartModel({
    required this.uid,
    required this.sushiId,
    required this.amount,
    required this.status,
  });

  factory AddCartModel.fromJson(Map<String, dynamic> json) => AddCartModel(
        uid: json["uid"],
        sushiId: json["sushi_id"],
        amount: json["amount"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "sushi_id": sushiId,
        "amount": amount,
        "status": status,
      };
}
