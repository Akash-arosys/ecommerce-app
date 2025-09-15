import 'dart:convert';

import 'package:real_estate/features/shop/models/cart_model.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/models/wishlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String wishlistKey = "wishlist";
  static const String cartKey = "cart";
  static const String ordersKey = "orders";

  // Save list of products
  static Future<void> saveProducts(String key, List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> productList = products
        .map((p) => json.encode(p.toJson()))
        .toList();
    await prefs.setStringList(key, productList);
  }

  // Load list of products
  static Future<List<Product>> loadProducts(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? productList = prefs.getStringList(key);
    if (productList != null) {
      return productList.map((p) => Product.fromJson(json.decode(p))).toList();
    }
    return [];
  }

  // Save wishlist
  static Future<void> saveWishlist(List<WishlistItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> list = items
        .map((item) => json.encode(item.toJson()))
        .toList();
    await prefs.setStringList(wishlistKey, list);
  }

  // Load wishlist items
  static Future<List<WishlistItem>> loadWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList(wishlistKey);
    if (list != null) {
      return list
          .map((item) => WishlistItem.fromJson(json.decode(item)))
          .toList();
    }
    return [];
  }

  // Save cart items
  static Future<void> saveCart(List<CartItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> list = items
        .map((item) => json.encode(item.toJson()))
        .toList();
    await prefs.setStringList(cartKey, list);
  }

  // Load cart items
  static Future<List<CartItem>> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? list = prefs.getStringList(cartKey);
    if (list != null) {
      return list.map((item) => CartItem.fromJson(json.decode(item))).toList();
    }
    return [];
  }

  // Save orders
  static Future<void> saveOrders(List<Product> products) async {
    await saveProducts(ordersKey, products);
  }

  // Load orders
  static Future<List<Product>> loadOrders() async {
    return await loadProducts(ordersKey);
  }

  // Clear data if needed
  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(wishlistKey);
    await prefs.remove(cartKey);
    await prefs.remove(ordersKey);
  }
}
