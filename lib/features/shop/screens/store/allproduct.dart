import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/grid_layout.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({
    super.key,
    required this.title,
    required this.products,
  });
  final String title;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    // final controller = CartController.instance;
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: Column(
            children: [
              DropdownButtonFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.sort),
                ),
                onChanged: (value) {},
                items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest']
                    .map(
                      (option) =>
                          DropdownMenuItem(value: option, child: Text(option)),
                    )
                    .toList(),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
              TGridLayout(
                mainAxisExtent: THelperFunctions.screenHeigh() * 0.34,
                itemCount: products.length,
                itemBuilder: (_, index) =>
                    TProductCardVertical(product: products[index]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
