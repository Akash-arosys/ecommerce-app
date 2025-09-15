import 'package:real_estate/features/shop/models/category_model.dart';
import 'package:real_estate/utils/constants/image_strings.dart';

final List<Category> dummyCategories = [
  Category(
    id: 1,
    name: "Electronics",
    image: TImages.electronicsIcon,
    subcategory: [
      Subcategory(id: 1, name: "Mobiles"),
      Subcategory(id: 2, name: "Refrigerators"),
      Subcategory(id: 3, name: "Mixers"),
      Subcategory(id: 4, name: "LED TV"),
    ],
  ),
  Category(
    id: 2,
    name: "Fashion",
    image: TImages.clothIcon,
    subcategory: [
      Subcategory(id: 5, name: "Jackets"),
      Subcategory(id: 6, name: "Shoes"),
      Subcategory(id: 7, name: "Men-Wear"),
    ],
  ),
  Category(
    id: 4,
    name: "Home & Kitchen",
    image: TImages.furnitureIcon,
    subcategory: [
      Subcategory(id: 14, name: "Almira"),
      Subcategory(id: 15, name: "Sofa"),
    ],
  ),
  Category(
    id: 5,
    name: "Sports",
    image: TImages.sportIcon,
    subcategory: [Subcategory(id: 8, name: "Cricket Gear")],
  ),
  Category(
    id: 3,
    name: "Books",
    image: TImages.booksIcon,
    subcategory: [
      Subcategory(id: 10, name: "Fiction"),
      Subcategory(id: 11, name: "Science"),
      Subcategory(id: 12, name: "Self Help"),
    ],
  ),
];

final List<String> dummyColors = ['Grey', 'Black', 'Indigo'];
final List<String> dummyColors2 = ['Red', 'Black', 'Blue', 'White', 'Yellow'];
final List<String> dummySize = ['S', 'M', 'L', 'XL', 'XXL'];
