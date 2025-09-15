import 'dart:math';

import 'package:get/get.dart';
import 'package:real_estate/common/widgets/grid_layout.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/features/shop/models/brand_model.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/screens/store/allproduct.dart';
import 'package:real_estate/features/shop/screens/store/brand_showcase.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });
  final int categoryId;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    List<Product> productList = dummyProducts
        .where((product) => product.category.id == categoryId)
        .toList();

    List<Brand> brandList = productList
        .map((product) => product.brand)
        .where((brand) => brand != null) // filter out nulls
        .cast<Brand>() // explicitly cast to List<Brand>
        .toSet()
        .toList();
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ...brandList.map((element) {
                List<Product> brandProductList = dummyProducts
                    .where((product) => product.brand?.id == element.id)
                    .toList();
                List<String> images = brandProductList.take(3).map((product) {
                  if (product.images != null) {
                    return product.images![Random().nextInt(
                      product.images?.length ?? 0,
                    )];
                  } else {
                    return TImages.default404;
                  }
                }).toList();
                return TBrandShowCase(
                  brandData: element,
                  images: images,
                  productCount: brandProductList.length.toString(),
                  onTap: () => Get.to(
                    () => AllProductsScreen(
                      title: element.name,
                      products: brandProductList,
                    ),
                  ),
                );
              }),

              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(
                title: 'You might like',
                onPressed: () => Get.to(
                  () => AllProductsScreen(
                    title: categoryName,
                    products: productList,
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                mainAxisExtent: THelperFunctions.screenHeigh() * 0.34,
                itemCount: productList.length > 6 ? 6 : productList.length,
                itemBuilder: (_, index) =>
                    TProductCardVertical(product: productList[index]),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
