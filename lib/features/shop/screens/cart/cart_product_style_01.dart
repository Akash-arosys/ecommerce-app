import 'package:real_estate/common/widgets/image_text_widget/rounded_image.dart';
import 'package:real_estate/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:real_estate/common/widgets/text/t_product_title_text.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    // required this.item,
  });

  // final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// 1 - Image
        TRoundedImage(
          width: 60,
          height: 60,
          imageUrl: TImages.productImage1,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey : TColors.white,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// 2 - Title, Price, & Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Brand and Title
              TBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(child: TProductTitleText(title: 'Shoe', maxLines: 1)),

              /// Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: ' Green',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
