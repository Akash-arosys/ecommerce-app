/* import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/grid_layout.dart';
import 'package:real_estate/common/widgets/icons/t_circular_icon.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/models/wishlist_model.dart';
import 'package:real_estate/features/shop/screens/home/home.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_estate/utils/local_storage/shared_preferences_helper.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});
  @override
  Widget build(BuildContext context) async{
List<WishlistItem> loadedWishlist = await SharedPrefsHelper.loadWishlist();
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Products Grid
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) =>
                    TProductCardVertical(product: dummyProducts[(index + 1)]),
              ),

              SizedBox(
                height:
                    TDeviceUtils.getBottomNavigationBarHeight() +
                    TSizes.defaultSpace,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/icons/t_circular_icon.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:real_estate/features/shop/models/wishlist_model.dart';
import 'package:real_estate/features/shop/screens/home/home.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/local_storage/shared_preferences_helper.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: FutureBuilder<List<WishlistItem>>(
        future: SharedPrefsHelper.loadWishlist(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading wishlist"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Your wishlist is empty"));
          } else {
            List<WishlistItem> loadedWishlist = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: ListView.builder(
                itemCount: loadedWishlist.length,
                itemBuilder: (context, index) {
                  final item = loadedWishlist[index];
                  return Padding(
                    padding: const EdgeInsets.all(TSizes.sm),
                    child: TProductCardHorizontal(product: item.product),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
