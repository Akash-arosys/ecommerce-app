import 'package:real_estate/utils/constants/image_strings.dart';

class Brand {
  final int id;
  final String name;
  final String? image;

  Brand({required this.id, required this.name, this.image});

  // fromJson using null-aware operator
  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(id: json['id'], name: json['name'], image: json['image']);
  }

  // toJson using null-aware operator
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image};
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Brand && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

final List<Brand> dummyBrands = [
  Brand(id: 1, name: "Apple", image: TImages.appleLogo),
  Brand(id: 4, name: "LG", image: TImages.lgLogo),
  Brand(id: 3, name: "Nike", image: TImages.nikeLogo),
  Brand(id: 6, name: "Samsung", image: TImages.samsungLogo),
  Brand(id: 5, name: "Adidas", image: TImages.adidasLogo),
  Brand(id: 2, name: "Hp", image: TImages.hpLogo),
];
