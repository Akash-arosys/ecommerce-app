import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/screens/checkout/checkout.dart';
import 'package:real_estate/features/shop/screens/product_detail/product_reviews.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/bottom_add_to_cart_widget.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(
              images: product.images ?? [TImages.default404],
              productId: product.id,
            ),

            /// 2 - Product Details
            Container(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// - Rating & Share
                  TRatingAndShare(
                    rating: product.rating.toString(),
                    reviewCount: product.reviews!.length.toString(),
                  ),

                  /// - Price, Title, Stock, & Brand
                  TProductMetaData(product: product),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  /// -- Attributes
                  // If Product has no variations do not show attributes as well.
                  if (product.color != null || product.size != null) ...[
                    TProductAttributes(product: product),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],

                  /// -- Checkout Button
                  SizedBox(
                    width: TDeviceUtils.getScreenWidth(context),
                    child: ElevatedButton(
                      child: const Text('Checkout'),
                      onPressed: () => Get.to(() => CheckoutScreen()),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Read more package
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// - Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        title:
                            'Reviews (${product.reviews!.length.toString()})',
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(
                          () => ProductReviewScreen(
                            reviews: product.reviews ?? [],
                            rating: product.rating ?? 0.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
