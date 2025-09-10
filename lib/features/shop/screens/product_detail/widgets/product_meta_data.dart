import 'package:real_estate/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:real_estate/common/widgets/image_text_widget/circular_image.dart';
import 'package:real_estate/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:real_estate/common/widgets/text/t_product_price_text.dart';
import 'package:real_estate/common/widgets/text/t_product_title_text.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/enums.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  // final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final controller = ProductController.instance;
    // final salePercentage = ProductController.instance.calculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            // if (salePercentage != null)
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
                    '5%',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge!.apply(color: TColors.black),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
              ],
            ),

            // Actual Price if sale price not null.
            // if (product.productVariations == null && product.salePrice != null)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '200',
                  style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
              ],
            ),

            // Price, Show sale price as main price if sale exist.
            TProductPriceText(price: '200', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        TProductTitleText(title: 'Shoe'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const TProductTitleText(title: 'Stock : ', smallSize: true),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.sportIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
              title: 'Nike',
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
