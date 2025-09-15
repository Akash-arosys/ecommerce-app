import 'package:real_estate/features/shop/models/product_model.dart';

class WishlistItem {
  final Product product;

  WishlistItem({required this.product});

  Map<String, dynamic> toJson() => {'product': product.toJson()};

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(product: Product.fromJson(json['product']));
  }
}
