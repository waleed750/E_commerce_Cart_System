// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final double quantity;
  final double price;
  final String? imagePath;
  ProductModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.imagePath,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    double? quantity,
    double? price,
    String? imagePath,
  }) {
    return ProductModel(
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'quantity': quantity,
      'price': price,
      'imagePath': imagePath,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      quantity: map['quantity'] as double,
      price: map['price'] as double,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, quantity: $quantity, price: $price)';
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.quantity == quantity &&
        other.price == price &&
        other.imagePath == imagePath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        quantity.hashCode ^
        price.hashCode ^
        imagePath.hashCode;
  }
}
