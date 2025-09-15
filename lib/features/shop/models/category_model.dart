import 'package:real_estate/features/shop/models/product_model.dart';

class Category {
  final int id;
  final String name;
  final String? image;
  final List<Subcategory>? subcategory;

  Category({
    required this.id,
    required this.name,
    this.image,
    this.subcategory,
  });

  // fromJson using null-aware operator
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((x) => Subcategory.fromJson(x))
          .toList(),
    );
  }

  // toJson using null-aware operator
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'subcategory': subcategory?.map((sub) => sub.toJson()).toList(),
    };
  }
}

class Subcategory {
  final int id;
  final String name;
  final List<Product>? product;

  Subcategory({required this.id, required this.name, this.product});

  // fromJson using null-aware operator
  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['id'],
      name: json['name'],
      product: (json['product'] as List<dynamic>?)
          ?.map((x) => Product.fromJson(x))
          .toList(),
    );
  }

  // toJson using null-aware operator
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'product': product?.map((prod) => prod.toJson()).toList(),
    };
  }
}
