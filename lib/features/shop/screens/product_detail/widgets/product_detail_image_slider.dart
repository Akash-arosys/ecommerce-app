import 'package:get/get.dart';
import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:real_estate/common/widgets/icons/t_circular_icon.dart';
import 'package:real_estate/common/widgets/image_text_widget/rounded_image.dart';
import 'package:real_estate/features/shop/controllers/product_controller.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.images,
    required this.productId,
  });
  final int productId;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final isDark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: isDark ? TColors.darkerGrey : TColors.white,
        child: Stack(
          children: [
            /// Main Large Image
            Obx(
              () => SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace * 2),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Image(
                        image: AssetImage(
                          images[controller.imageCurrentIndex.value],
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: images.length,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder: (_, index) {
                    return TRoundedImage(
                      width: 80,
                      fit: BoxFit.contain,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(TSizes.sm),
                      backgroundColor: isDark ? TColors.dark : TColors.white,
                      onPressed: () => controller.updateImageIndicator(index),
                      border: Border.all(color: Colors.transparent),
                    );
                  },
                ),
              ),
            ),

            /// Appbar Icons
            TAppBar(
              showBackArrow: true,
              actions: [
                Obx(() {
                  bool isInWishlist = controller.isInWishlist(productId);
                  return TCircularIcon(
                    icon: isInWishlist ? Iconsax.heart5 : Iconsax.heart,
                    color: TColors.error,
                    onPressed: () =>
                        controller.addToWishlist(context, productId),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
