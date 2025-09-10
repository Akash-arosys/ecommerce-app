import 'package:real_estate/common/widgets/rounded_choice_chips.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/common/widgets/text/t_product_price_text.dart';
import 'package:real_estate/common/widgets/text/t_product_title_text.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- Selected Attribute Pricing & Description
        // Display variation price and stock when some variation is selected.
        // if (controller.selectedVariation.value.id.isNotEmpty)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const TSectionHeading(
                  title: 'Variation: ',
                  showActionButton: false,
                ),
                const SizedBox(width: TSizes.spaceBtwItems),

                /// Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Actual Price if sale price not null.
                        const TProductTitleText(
                          title: 'Price : ',
                          smallSize: true,
                        ),
                        // if (controller.selectedVariation.value.salePrice != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: TSizes.spaceBtwItems),
                            Text(
                              "200",
                              style: Theme.of(context).textTheme.titleSmall!
                                  .apply(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                          ],
                        ),
                        // Sale Price if sale price not null Else Simple Price.
                        TProductPriceText(
                          // price: controller.selectedVariation.value.salePrice != null
                          //     ? controller.selectedVariation.value.salePrice.toString()
                          //     : controller.selectedVariation.value.price.toString(),
                          price: "200",
                        ),
                      ],
                    ),

                    /// Stock
                    Row(
                      children: [
                        const TProductTitleText(
                          title: 'Stock : ',
                          smallSize: true,
                        ),
                        Text(
                          "In Stock",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            /// Description
            TProductTitleText(
              title:
                  "This is the description of the product and is can go upto max 4 lines",
              smallSize: true,
              maxLines: 4,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// -- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Colors'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true),
                TChoiceChip(text: 'Red', selected: false),
                TChoiceChip(text: 'Blue', selected: false),
              ],
            ),
          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: 'Size'),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true),
                TChoiceChip(text: 'EU 36', selected: false),
                TChoiceChip(text: 'EU 38', selected: false),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
