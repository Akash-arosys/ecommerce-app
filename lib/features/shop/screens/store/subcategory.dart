import 'package:get/get.dart';
import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/image_text_widget/rounded_image.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/features/shop/models/category_model.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/screens/store/allproduct.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubcategoryScreen extends StatelessWidget {
  const SubcategoryScreen({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text(category.name), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TRoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              // Check if subcategories are empty or null
              if (category.subcategory == null || category.subcategory!.isEmpty)
                Center(
                  child: Text(
                    'No subcategory found',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                )
              else
                ...category.subcategory!.map((element) {
                  List<Product> filteredProducts = dummyProducts
                      .where((product) => product.subcategory.id == element.id)
                      .toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                        title: element.name,
                        onPressed: () => Get.to(
                          () => AllProductsScreen(
                            title: element.name,
                            products: filteredProducts,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120,
                        child: ListView.separated(
                          itemCount: filteredProducts.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: TSizes.spaceBtwItems),
                          itemBuilder: (context, index) {
                            return TProductCardHorizontal(
                              product: filteredProducts[index],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                    ],
                  );
                }),
            ],
          ),
        ),
      ),
    );
  }
}
