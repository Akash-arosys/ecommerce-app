import 'package:real_estate/data/dummy_data.dart';
import 'package:real_estate/features/shop/models/brand_model.dart';
import 'package:real_estate/features/shop/models/category_model.dart';
import 'package:real_estate/features/shop/models/review_model.dart';
import 'package:real_estate/utils/constants/image_strings.dart';

class Product {
  final int id;
  final String name;
  final Category category;
  final Subcategory subcategory;
  final Brand? brand;
  final double? price;
  final double offerPrice;
  final int stock;
  final String? type;
  final List<String>? color;
  final List<String>? size;
  final String description;
  final double? rating;
  final List<Review>? reviews;
  final List<String>? images;

  Product({
    required this.id,
    required this.name,
    this.price,
    required this.offerPrice,
    required this.stock,
    this.type,
    required this.category,
    required this.subcategory,
    this.brand,
    this.color,
    this.size,
    required this.description,
    this.rating,
    this.reviews,
    this.images,
  });

  // fromJson factory constructor using null-aware operators
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: (json['price'] as num?)?.toDouble(),
      offerPrice: (json['offerPrice'] as num).toDouble(),
      stock: json['stock'],
      type: json['type'],
      category: Category.fromJson(json['category']),
      subcategory: Subcategory.fromJson(json['subcategory']),
      brand: json['brand'] != null ? Brand.fromJson(json['brand']) : null,
      color: (json['color'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      size: (json['size'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'],
      rating: (json['rating'] as num?)?.toDouble(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((x) => Review.fromJson(x))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  // toJson method using null-aware operator
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'offerPrice': offerPrice,
      'stock': stock,
      'type': type,
      'category': category.toJson(),
      'subcategory': subcategory.toJson(),
      'brand': brand?.toJson(),
      'color': color,
      'size': size,
      'description': description,
      'rating': rating,
      'reviews': reviews?.map((review) => review.toJson()).toList(),
      'images': images,
    };
  }
}

final List<Product> dummyProducts = [
  Product(
    id: 1,
    name: "iPhone 14",
    category: Category(id: 1, name: 'Electronics'),
    subcategory: Subcategory(id: 1, name: 'Mobiles'),
    brand: Brand(id: 1, name: 'Apple', image: TImages.appleLogo),
    price: 99999,
    offerPrice: 94999,
    stock: 10,
    type: 'Popular',
    color: dummyColors,
    description: "Latest iPhone with advanced features.",
    rating: 4.8,
    reviews: dummyReviews,
    images: [
      TImages.eletronProd21,
      TImages.eletronProd22,
      TImages.eletronProd23,
      TImages.eletronProd24,
      TImages.eletronProd25,
    ],
  ),
  Product(
    id: 2,
    name: "Samsung Galaxy S21",
    category: Category(id: 1, name: 'Electronics'),
    subcategory: Subcategory(id: 1, name: 'Mobiles'),
    brand: Brand(id: 6, name: 'Samsung', image: TImages.samsungLogo),
    price: 79999,
    offerPrice: 74999,
    stock: 15,
    type: 'Best Seller',
    color: dummyColors,
    description: "High performance smartphone.",
    rating: 4.5,
    reviews: dummyReviews,
    images: [
      TImages.eletronProd14,
      TImages.eletronProd11,
      TImages.eletronProd12,
      TImages.eletronProd13,
    ],
  ),
  Product(
    id: 3,
    name: "LG Double Door Refrigerator",
    category: Category(id: 1, name: 'Electronics'),
    subcategory: Subcategory(id: 2, name: 'Refrigerators'),
    brand: Brand(id: 4, name: 'LG', image: TImages.lgLogo),
    price: 45000,
    offerPrice: 41999,
    stock: 8,
    color: dummyColors,
    description:
        "More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement. Colour Shown: Sequoia/Bright Citron/Black Style: IH4119-300 Country/Region of Origin: Vietnam",
    rating: 4.3,
    reviews: dummyReviews,
    images: [
      TImages.eletronProd41,
      TImages.eletronProd42,
      TImages.eletronProd43,
    ],
  ),
  // Electronics - Mixer
  Product(
    id: 4,
    name: "Philips Mixer Grinder",
    category: Category(id: 1, name: 'Electronics'),
    subcategory: Subcategory(id: 3, name: 'Mixers'),
    // brand: Brand(id: 4, name: 'LG'),
    // price: 3200,
    offerPrice: 2999,
    stock: 0,
    type: 'Best Seller',
    color: dummyColors,
    description: "Efficient mixer for all kitchen needs.",
    rating: 4.1,
    reviews: dummyReviews,
    images: [
      TImages.eletronProd31,
      TImages.eletronProd32,
      TImages.eletronProd33,
    ],
  ),
  // Electronics - LED TV
  Product(
    id: 5,
    name: "Samsung 43 inch LED TV",
    category: Category(id: 1, name: 'Electronics'),
    subcategory: Subcategory(id: 4, name: 'LED TV'),
    brand: Brand(id: 6, name: 'Samsung', image: TImages.samsungLogo),
    price: 35000,
    offerPrice: 32999,
    stock: 12,
    color: dummyColors,
    description: "Crystal clear display with smart features.",
    rating: 4.6,
    reviews: dummyReviews,
    images: [
      TImages.eletronProd51,
      TImages.eletronProd52,
      TImages.eletronProd53,
      TImages.eletronProd54,
      TImages.eletronProd55,
    ],
  ),
  // Fashion - Jackets
  Product(
    id: 6,
    name: "Men's Winter Jacket",
    category: Category(id: 2, name: 'Fashion'),
    subcategory: Subcategory(id: 5, name: 'Jackets'),
    brand: Brand(id: 3, name: 'Nike', image: TImages.nikeLogo),
    price: 2500,
    offerPrice: 2199,
    stock: 25,
    size: dummySize,
    description: "Stylish and warm winter jacket.",
    rating: 4.2,
    reviews: dummyReviews,
    images: [
      TImages.fashionProd11,
      TImages.fashionProd12,
      TImages.fashionProd13,
      TImages.fashionProd14,
      TImages.fashionProd15,
    ],
  ),
  // Fashion - Nike Shoe
  Product(
    id: 7,
    name: "Nike Running Shoes",
    category: Category(id: 2, name: 'Fashion'),
    subcategory: Subcategory(id: 6, name: 'Shoes'),
    brand: Brand(id: 3, name: 'Nike', image: TImages.nikeLogo),
    price: 5500,
    offerPrice: 4999,
    stock: 18,
    type: 'Best Seller',
    color: dummyColors,
    size: dummySize,
    description: "Comfortable running shoes with grip support.",
    rating: 4.5,
    reviews: dummyReviews,
    images: [
      TImages.fashionProd21,
      TImages.fashionProd22,
      TImages.fashionProd23,
      TImages.fashionProd24,
    ],
  ),
  // Fashion - Adidas Shoe
  Product(
    id: 8,
    name: "Adidas Sports Shoes",
    category: Category(id: 2, name: 'Fashion'),
    subcategory: Subcategory(id: 6, name: 'Shoes'),
    brand: Brand(id: 5, name: 'Adidas', image: TImages.adidasLogo),
    price: 5200,
    offerPrice: 4799,
    stock: 22,
    type: 'Popular',
    color: dummyColors,
    size: dummySize,
    description: "Durable and stylish sports shoes.",
    rating: 4.4,
    reviews: dummyReviews,
    images: [
      TImages.fashionProd31,
      TImages.fashionProd32,
      TImages.fashionProd33,
    ],
  ),
  // Fashion - T-Shirts
  Product(
    id: 9,
    name: "Casual Printed T-Shirt",
    category: Category(id: 2, name: 'Fashion'),
    subcategory: Subcategory(id: 7, name: 'Men-Wear'),
    brand: Brand(id: 3, name: 'Nike', image: TImages.nikeLogo),
    price: 899,
    offerPrice: 749,
    stock: 30,
    color: dummyColors2,
    size: dummySize,
    description: "Lightweight and trendy T-shirt for everyday wear.",
    rating: 4.1,
    reviews: dummyReviews,
    images: [
      TImages.fashionProd51,
      TImages.fashionProd52,
      TImages.fashionProd53,
      TImages.fashionProd54,
      TImages.fashionProd55,
      TImages.fashionProd56,
      TImages.fashionProd57,
    ],
  ),
  // Fashion - Jeans
  Product(
    id: 10,
    name: "Denim Jeans",
    category: Category(id: 2, name: 'Fashion'),
    subcategory: Subcategory(id: 7, name: 'Men-Wear'),
    brand: Brand(id: 3, name: 'Nike', image: TImages.nikeLogo),
    price: 1999,
    offerPrice: 1699,
    stock: 28,
    color: dummyColors,
    size: dummySize,
    description: "Classic denim jeans with comfortable fit.",
    rating: 4.3,
    reviews: dummyReviews,
    images: [
      TImages.fashionProd61,
      TImages.fashionProd62,
      TImages.fashionProd63,
      TImages.fashionProd64,
      TImages.fashionProd65,
    ],
  ),
  // Fashion - Shirts
  Product(
    id: 11,
    name: "Formal Shirt",
    category: Category(id: 2, name: 'Fashion'),
    subcategory: Subcategory(id: 7, name: 'Men-Wear'),
    brand: Brand(id: 5, name: 'Adidas', image: TImages.adidasLogo),
    price: 1499,
    offerPrice: 1299,
    stock: 20,
    type: 'Popular',
    color: dummyColors2,
    size: dummySize,
    description: "Perfect shirt for office and formal occasions.",
    rating: 4.2,
    reviews: dummyReviews,
    images: [
      TImages.fashionProd71,
      TImages.fashionProd72,
      TImages.fashionProd73,
    ],
  ),
  // Fashion - Adidas T-Shirt
  Product(
    id: 12,
    name: "Adidas Sports T-Shirt",
    category: Category(id: 2, name: 'Fashion'),
    subcategory: Subcategory(id: 7, name: 'Men-Wear'),
    brand: Brand(id: 5, name: 'Adidas', image: TImages.adidasLogo),
    price: 1099,
    offerPrice: 949,
    stock: 25,
    type: 'Best Seller',
    color: dummyColors2,
    size: dummySize,
    description: "Breathable and flexible sportswear.",
    rating: 4.5,
    reviews: dummyReviews,
    images: [
      TImages.fashionProd81,
      TImages.fashionProd82,
      TImages.fashionProd83,
      TImages.fashionProd84,
    ],
  ),
  // Books - Fiction
  Product(
    id: 13,
    name: "The Great Gatsby",
    category: Category(id: 3, name: 'Books'),
    subcategory: Subcategory(id: 10, name: 'Fiction'),
    price: 299,
    offerPrice: 249,
    stock: 50,
    description: "Classic novel of the Jazz Age.",
    rating: 4.7,
    reviews: dummyReviews,
    images: [TImages.bookProd11],
  ),
  // Books - Science
  Product(
    id: 14,
    name: "A Brief History of Time",
    category: Category(id: 3, name: 'Books'),
    subcategory: Subcategory(id: 11, name: 'Science'),
    price: 349,
    offerPrice: 299,
    stock: 40,
    type: 'Popular',
    description: "Exploring space and time.",
    rating: 4.6,
    reviews: dummyReviews,
    images: [TImages.bookProd12],
  ),
  // Books - Biography
  Product(
    id: 15,
    name: "Steve Jobs",
    category: Category(id: 3, name: 'Books'),
    subcategory: Subcategory(id: 12, name: 'Self Help'),
    price: 399,
    offerPrice: 349,
    stock: 30,
    description: "Biography of Apple co-founder Steve Jobs.",
    rating: 4.5,
    reviews: dummyReviews,
    images: [TImages.bookProd13],
  ),
  // Books - Self Help
  Product(
    id: 16,
    name: "The Power of Now",
    category: Category(id: 3, name: 'Books'),
    subcategory: Subcategory(id: 12, name: 'Self Help'),
    price: 299,
    offerPrice: 249,
    stock: 35,
    type: 'Best Seller',
    description: "Guide to spiritual enlightenment.",
    rating: 4.4,
    reviews: dummyReviews,
    images: [TImages.bookProd14],
  ),
  // Home & Kitchen - Almira
  Product(
    id: 17,
    name: "Wooden Almira",
    category: Category(id: 4, name: 'Home & Kitchen'),
    subcategory: Subcategory(id: 14, name: 'Almira'),
    price: 7000,
    offerPrice: 6499,
    stock: 15,
    color: dummyColors2,
    description:
        "Spacious wooden almira with mirror.More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement. Colour Shown: Sequoia/Bright Citron/Black Style: IH4119-300 Country/Region of Origin: Vietnam",
    rating: 4.3,
    reviews: dummyReviews,
    images: [TImages.homeProd11, TImages.homeProd12, TImages.homeProd13],
  ),
  // Home & Kitchen - Sofa
  Product(
    id: 18,
    name: "3 Seater Sofa",
    category: Category(id: 4, name: 'Home & Kitchen'),
    subcategory: Subcategory(id: 15, name: 'Sofa'),
    price: 12000,
    offerPrice: 10999,
    stock: 10,
    color: dummyColors,
    description: "Comfortable and stylish sofa.",
    rating: 4.5,
    reviews: dummyReviews,
    images: [TImages.homeProd31, TImages.homeProd32, TImages.homeProd33],
  ),
  // Home & Kitchen - Almira (Second entry)
  Product(
    id: 19,
    name: "Steel Almira",
    category: Category(id: 4, name: 'Home & Kitchen'),
    subcategory: Subcategory(id: 14, name: 'Almira'),
    price: 5000,
    offerPrice: 4599,
    stock: 20,
    color: dummyColors2,
    description:
        "Durable steel almira for home storage.More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement. Colour Shown: Sequoia/Bright Citron/Black Style: IH4119-300 Country/Region of Origin: Vietnam",
    rating: 4.2,
    reviews: dummyReviews,
    images: [TImages.homeProd21, TImages.homeProd22, TImages.homeProd13],
  ),
  // Sports - Cricket Bat
  Product(
    id: 20,
    name: "Cricket Bat",
    category: Category(id: 5, name: 'Sports'),
    subcategory: Subcategory(id: 8, name: 'Cricket Gear'),
    price: 3500,
    offerPrice: 3199,
    stock: 18,
    type: 'Best Seller',
    description: "Lightweight bat with better grip.",
    rating: 4.4,
    reviews: dummyReviews,
    images: [TImages.sportsProd31, TImages.sportsProd32, TImages.sportsProd33],
  ),
  // Sports - Ball
  Product(
    id: 21,
    name: "Cricket Ball",
    category: Category(id: 5, name: 'Sports'),
    subcategory: Subcategory(id: 8, name: 'Cricket Gear'),
    offerPrice: 449,
    stock: 40,
    description: "Durable ball for practice and matches.",
    rating: 4.3,
    reviews: dummyReviews,
    images: [TImages.sportsProd21, TImages.sportsProd22, TImages.sportsProd23],
  ),
  // Sports - Helmet
  Product(
    id: 22,
    name: "Cricket Helmet",
    category: Category(id: 5, name: 'Sports'),
    subcategory: Subcategory(id: 8, name: 'Cricket Gear'),
    offerPrice: 2299,
    stock: 15,
    description: "High protection helmet for safety.",
    rating: 4.5,
    reviews: dummyReviews,
    images: [TImages.sportsProd11, TImages.sportsProd12, TImages.sportsProd13],
  ),
];
