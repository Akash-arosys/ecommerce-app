import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/features/shop/screens/checkout/checkout.dart';
import 'package:real_estate/features/shop/screens/product_detail/product_reviews.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/bottom_add_to_cart_widget.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/rating_share_widget.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 1 - Product Image Slider
            TProductImageSlider(),

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
                  const TRatingAndShare(),

                  /// - Price, Title, Stock, & Brand
                  TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  /// -- Attributes
                  // If Product has no variations do not show attributes as well.
                  TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

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
                    'More Air, less bulk. The Dn8 takes our Dynamic Air system and condenses it into a sleek, low-profile package. Powered by eight pressurised Air tubes, it gives you a responsive sensation with every step. Enter an unreal experience of movement. Colour Shown: Sequoia/Bright Citron/Black Style: IH4119-300 Country/Region of Origin: Vietnam',
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
                      const TSectionHeading(
                        title: 'Reviews (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                        onPressed: () => Get.to(() => ProductReviewScreen()),
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
