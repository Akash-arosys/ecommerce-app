import 'package:real_estate/common/widgets/grid_layout.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/features/shop/screens/store/brand_showcase.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TBrandShowCase(
                images: [
                  TImages.productImage11,
                  TImages.productImage10,
                  TImages.productImage12,
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TSectionHeading(title: 'You might like', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),
              TGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
