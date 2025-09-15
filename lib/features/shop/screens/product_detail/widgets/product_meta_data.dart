import 'package:real_estate/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:real_estate/common/widgets/image_text_widget/circular_image.dart';
import 'package:real_estate/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:real_estate/common/widgets/text/t_product_price_text.dart';
import 'package:real_estate/common/widgets/text/t_product_title_text.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/enums.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/utils/helpers/pricing_calculator.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    // final controller = ProductController.instance;
    // final salePercentage = ProductController.instance.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            if (product.price != null)
              Row(
                children: [
                  TRoundedContainer(
                    backgroundColor: TColors.primary,
                    radius: TSizes.sm,
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.sm,
                      vertical: TSizes.xs,
                    ),
                    child: Text(
                      TPricingCalculator.calculateDiscountPercent(
                        product.price ?? 0,
                        product.offerPrice,
                      ),
                      style: Theme.of(
                        context,
                      ).textTheme.labelLarge!.apply(color: TColors.black),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                ],
              ),

            // Actual Price if sale price not null.
            TProductPriceText(
              price: product.offerPrice.toString(),
              isLarge: true,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            if (product.price != null)
              Text(
                product.price.toString(),
                style: Theme.of(context).textTheme.titleSmall!.apply(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        TProductTitleText(title: product.name),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(title: 'Stock : ', smallSize: true),
            product.stock > 0
                ? Text(
                    'In Stock',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(
                    'Out Of Stock',
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.apply(color: TColors.error),
                  ),
          ],
        ),

        /// Brand
        if (product.brand != null) ...[
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              TCircularImage(
                image: product.brand?.image ?? TImages.default404,
                width: 32,
                height: 32,
                padding: TSizes.xs,
              ),
              TBrandTitleWithVerifiedIcon(
                title: product.brand?.name ?? '',
                brandTextSize: TextSizes.medium,
              ),
            ],
          ),
        ],
      ],
    );
  }
}
