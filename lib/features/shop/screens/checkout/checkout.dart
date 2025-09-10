import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:real_estate/features/shop/screens/cart/cart_items.dart';
import 'package:real_estate/features/shop/screens/checkout/billing_address_section.dart';
import 'package:real_estate/features/shop/screens/checkout/billing_amount_section.dart';
import 'package:real_estate/features/shop/screens/checkout/billing_payment_section.dart';
import 'package:real_estate/features/shop/screens/checkout/coupon_widget.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:real_estate/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final cartController = CartController.instance;
    // Get.put(AddressController());
    // final subTotal = cartController.totalCartPrice.value;
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: const TAppBar(title: Text('Order Review'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              const TCouponCode(),

              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                borderColor: TColors.dashboardAppbarBackground,
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(subTotal: 200),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    const TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    /// Address
                    TBillingAddressSection(
                      name: 'Arosys',
                      phoneNumber: '8523697411',
                      address: 'testing address',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              'Checkout \$${TPricingCalculator.calculateTotalPrice(200, 'US')}',
            ),
          ),
        ),
      ),
    );
  }
}
