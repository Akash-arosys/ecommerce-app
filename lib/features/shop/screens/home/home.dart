import 'package:real_estate/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:real_estate/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:real_estate/common/widgets/grid_layout.dart';
import 'package:real_estate/common/widgets/image_text_widget/vertical_image_text.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/data/dummy_data.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/screens/home/home_appbar.dart';
import 'package:real_estate/features/shop/screens/home/promo_slider.dart';
import 'package:real_estate/features/shop/screens/store/allproduct.dart';
import 'package:real_estate/features/shop/screens/store/subcategory.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/constants/text_string.dart';
import 'package:real_estate/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:real_estate/utils/helpers/exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Product> popularProducts = dummyProducts
        .where((product) => product.type == 'Popular')
        .toList();
    List<Product> bestSellerProducts = dummyProducts
        .where((product) => product.type == 'Best Seller')
        .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TSearchContainer(text: "Search in Store"),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: dummyCategories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final category = dummyCategories[index];
                              return TVerticalImageText(
                                image: category.image ?? TImages.default404,
                                title: category.name,
                                backgroundColor: TColors.white,
                                // iconColor: TColors.black,
                                onTap: () => Get.to(
                                  () => SubcategoryScreen(category: category),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Promo Slider 1
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Popular Products
                  TSectionHeading(
                    title: TTexts.popularProducts,
                    onPressed: () => Get.to(
                      () => AllProductsScreen(
                        title: TTexts.popularProducts,
                        products: popularProducts,
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    mainAxisExtent: THelperFunctions.screenHeigh() * 0.34,
                    itemCount: popularProducts.length,
                    itemBuilder: (_, index) =>
                        TProductCardVertical(product: popularProducts[index]),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2),

                  /// -- Promo Slider 2
                  const TPromoSlider(
                    banners: [
                      TImages.banner2,
                      TImages.banner3,
                      TImages.banner4,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Popular Products
                  TSectionHeading(
                    title: TTexts.bestSellerProducts,
                    onPressed: () => Get.to(
                      () => AllProductsScreen(
                        title: TTexts.bestSellerProducts,
                        products: bestSellerProducts,
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TGridLayout(
                    mainAxisExtent: THelperFunctions.screenHeigh() * 0.34,
                    itemCount: bestSellerProducts.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: bestSellerProducts[index],
                    ),
                  ),
                  SizedBox(
                    height:
                        TDeviceUtils.getBottomNavigationBarHeight() +
                        TSizes.defaultSpace,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
