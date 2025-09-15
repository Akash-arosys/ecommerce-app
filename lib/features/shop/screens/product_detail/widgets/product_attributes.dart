import 'package:real_estate/common/widgets/rounded_choice_chips.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/common/widgets/text/t_product_price_text.dart';
import 'package:real_estate/common/widgets/text/t_product_title_text.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});
  final Product product;
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
                          title: 'Price :',
                          smallSize: true,
                        ),

                        const SizedBox(width: TSizes.spaceBtwItems / 2),
                        TProductPriceText(
                          // price: controller.selectedVariation.value.salePrice != null
                          //     ? controller.selectedVariation.value.salePrice.toString()
                          //     : controller.selectedVariation.value.price.toString(),
                          price: product.offerPrice.toString(),
                        ),

                        const SizedBox(width: TSizes.spaceBtwItems / 2),

                        if (product.price != null)
                          Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.bodyMedium!
                                .apply(decoration: TextDecoration.lineThrough),
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
                        product.stock > 0
                            ? Text(
                                'In Stock',
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            : Text(
                                'Out Of Stock',
                                style: Theme.of(context).textTheme.bodyMedium!
                                    .apply(color: TColors.error),
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
        if (product.color != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: 'Colors', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: (product.color ?? []).map((e) {
                  return TChoiceChip(text: e, selected: false);
                }).toList(),
              ),
            ],
          ),
        if (product.size != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TSectionHeading(title: 'Size', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              Wrap(
                spacing: 8,
                children: (product.size ?? []).map((e) {
                  return TChoiceChip(text: e, selected: false);
                }).toList(),
              ),
            ],
          ),
      ],
    );
  }
}
