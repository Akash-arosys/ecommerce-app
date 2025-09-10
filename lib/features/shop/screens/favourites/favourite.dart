import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/grid_layout.dart';
import 'package:real_estate/common/widgets/icons/t_circular_icon.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:real_estate/features/shop/screens/home/home.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Products Grid
              TGridLayout(
                itemCount: 6,
                itemBuilder: (_, index) => TProductCardVertical(),
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
