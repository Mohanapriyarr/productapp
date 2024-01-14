// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductListModel> productListModelFromJson(String str) =>
    List<ProductListModel>.from(
        json.decode(str).map((x) => ProductListModel.fromJson(x)));

String productListModelToJson(List<ProductListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListModel {
  final String productName;
  final String productId;
  final int availableQuantity;

  ProductListModel({
    required this.productName,
    required this.productId,
    required this.availableQuantity,
  });

  ProductListModel copyWith({
    String? productName,
    String? productId,
    int? availableQuantity,
  }) =>
      ProductListModel(
        productName: productName ?? this.productName,
        productId: productId ?? this.productId,
        availableQuantity: availableQuantity ?? this.availableQuantity,
      );

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        productName: json["productName"],
        productId: json["productId"],
        availableQuantity: json["availableQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "productId": productId,
        "availableQuantity": availableQuantity,
      };
}
