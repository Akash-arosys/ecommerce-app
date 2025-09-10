import 'package:real_estate/common/widgets/text/t_product_price_text.dart';
import 'package:real_estate/features/shop/screens/cart/add_remove_cart_button.dart';
import 'package:real_estate/features/shop/screens/cart/cart_product_style_01.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    // final cartController = Get.put(CartController());
    // final cartItems = cartController.cartItems;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (context, index) {
        // final item = cartItems[index];
        return Column(
          children: [
            /// -- Cart Items
            TCartItem(),
            if (showAddRemoveButtons)
              const SizedBox(height: TSizes.spaceBtwItems),

            /// -- Add Remove Buttons and Price Total
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// -- Add Remove Buttons
                  Row(
                    children: [
                      // Use to add space to the left of Buttons as image space.
                      const SizedBox(width: 70),

                      /// Add Remove Buttons
                      TProductQuantityWithAddRemoveButton(
                        width: 32,
                        height: 32,
                        iconSize: TSizes.md,
                        quantity: 2,
                        addBackgroundColor: TColors.dashboardAppbarBackground,
                        removeForegroundColor:
                            THelperFunctions.isDarkMode(context)
                            ? TColors.white
                            : TColors.black,
                        removeBackgroundColor:
                            THelperFunctions.isDarkMode(context)
                            ? TColors.darkerGrey
                            : TColors.white,
                        add: () {},
                        remove: () {},
                      ),
                    ],
                  ),

                  /// -- Product total price
                  TProductPriceText(price: '200'),
                ],
              ),
          ],
        );
      },
    );
  }
}
