import 'package:real_estate/common/styles/shadows.dart';
import 'package:real_estate/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:real_estate/common/widgets/icons/t_circular_icon.dart';
import 'package:real_estate/common/widgets/image_text_widget/rounded_image.dart';
import 'package:real_estate/common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import 'package:real_estate/common/widgets/text/t_product_price_text.dart';
import 'package:real_estate/common/widgets/text/t_product_title_text.dart';
import 'package:real_estate/features/shop/controllers/product_controller.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/screens/product_detail/product_detail.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/enums.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_estate/utils/helpers/pricing_calculator.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    // final cartController = CartController.instance;
    final controller = Get.put(ProductController());
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),

      /// Container with side paddings, color, edges, radius and shadow.
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Thumbnail, Wishlist Button, Discount Tag
            TRoundedContainer(
              height: THelperFunctions.screenHeigh() * 0.2,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.white,
              child: Stack(
                children: [
                  /// -- Thumbnail Image
                  Center(
                    child: TRoundedImage(
                      imageUrl: product.images?[0] ?? TImages.default404,
                      applyImageRadius: true,
                    ),
                  ),

                  /// -- Sale Tag
                  if (product.price != null)
                    Positioned(
                      top: 0,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.primary.withValues(alpha: 0.8),
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
                    ),

                  /// -- Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(() {
                      bool isInWishlist = controller.isInWishlist(product.id);
                      return TCircularIcon(
                        height: TSizes.iconLg * 1.2,
                        width: TSizes.iconLg * 1.2,
                        icon: isInWishlist ? Iconsax.heart5 : Iconsax.heart,
                        color: TColors.error,
                        onPressed: () =>
                            controller.addToWishlist(context, product.id),
                      );
                    }),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                ],
              ),
            ),

            /// -- Details
            SizedBox(
              height: THelperFunctions.screenHeigh() * 0.12,
              child: Padding(
                padding: const EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: product.name,
                          smallSize: true,
                          maxLines: 1,
                        ),
                        if (product.brand != null) ...[
                          const SizedBox(height: TSizes.spaceBtwItems / 4),
                          TBrandTitleWithVerifiedIcon(
                            title: product.brand!.name,
                            brandTextSize: TextSizes.small,
                          ),
                        ],
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// Pricing
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Actual Price if sale price not null
                              if (product.price != null && product.price! > 0)
                                Text(
                                  product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),

                              /// Price, Show sale price as main price if sale exist.
                              TProductPriceText(
                                price: product.offerPrice.toString(),
                              ),
                              SizedBox(height: TSizes.sm),
                            ],
                          ),
                        ),

                        /// Add to cart
                        GestureDetector(
                          onTap: () {
                            // If the product have variations then show the product Details for variation selection.
                            // ELse add product to the cart.
                            // if (product.productVariations == null) {
                            //   cartController.addSingleItemToCart(
                            //     product,
                            //     ProductVariationModel.empty(),
                            //   );
                            // } else {
                            //   Get.to(() => ProductDetailScreen(product: product));
                            // }
                          },
                          child: AnimatedContainer(
                            curve: Curves.easeInOutCubicEmphasized,
                            decoration: BoxDecoration(
                              color: TColors.dark,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(TSizes.cardRadiusMd),
                                bottomRight: Radius.circular(
                                  TSizes.productImageRadius,
                                ),
                              ),
                            ),
                            duration: const Duration(milliseconds: 300),
                            child: SizedBox(
                              width: TSizes.iconLg * 1.2,
                              height: TSizes.iconLg * 1.2,
                              child: Center(
                                child: const Icon(
                                  Iconsax.add,
                                  color: TColors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
