import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/models/wishlist_model.dart';
import 'package:real_estate/utils/local_storage/shared_preferences_helper.dart';
import 'package:real_estate/utils/popups/confirmation_dialog.dart';
import 'package:real_estate/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  List<Product> allProducts = [];
  RxList<WishlistItem> wishlist = <WishlistItem>[].obs;
  final imageCurrentIndex = 0.obs;

  @override
  void onInit() {
    allProducts = dummyProducts;
    loadWishlist();
    super.onInit();
  }

  void updateImageIndicator(index) {
    imageCurrentIndex.value = index;
  }

  Future<void> loadWishlist() async {
    wishlist.value = await SharedPrefsHelper.loadWishlist();
  }

  bool isInWishlist(int productId) {
    return wishlist.any((item) => item.product.id == productId);
  }

  Future<void> addToWishlist(BuildContext context, int productId) async {
    Product? product;
    try {
      product = allProducts.firstWhere((p) => p.id == productId);
    } catch (e) {
      product = null;
    }

    if (product == null) {
      print("Product not found");
      return;
    }

    // Check if product already exists in wishlist
    bool exists = wishlist.any((item) => item.product.id == productId);

    if (!exists) {
      // Add to the reactive list
      wishlist.add(WishlistItem(product: product));

      // Save updated list to shared preferences
      await SharedPrefsHelper.saveWishlist(wishlist);

      TLoaders.customToast(message: 'Product Added To Wishlist');
    } else {
      // Show confirmation dialog

      /*  bool? confirmed = await Get.defaultDialog<bool>(
        title: "Remove from Wishlist",
        middleText:
            "Are you sure you want to remove this product from your wishlist?",
        textCancel: "No",
        textConfirm: "Yes",
        confirmTextColor: TColors.white,
        onConfirm: () {
          Get.back(result: true);
        },
        onCancel: () {
          Get.back(result: false);
        },
      ); */
      bool confirmed =
          await showDialog<bool>(
            context: context,
            builder: (context) => ConfirmationDialog(
              message:
                  "Are you sure you want to remove this product from your wishlist?",
              title: "Remove from Wishlist",
            ),
          ) ??
          false;

      if (confirmed == true) {
        // Remove from the reactive list
        wishlist.removeWhere((item) => item.product.id == productId);

        // Save updated list to shared preferences
        await SharedPrefsHelper.saveWishlist(wishlist);

        TLoaders.customToast(message: 'Product Removed from Wishlist');
      }
    }
  }
}
