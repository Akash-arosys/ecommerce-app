import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/features/shop/screens/cart/cart_items.dart';
import 'package:real_estate/features/shop/screens/checkout/checkout.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = CartController.instance;
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),

          /// -- Items in Cart
          child: TCartItems(showAddRemoveButtons: true),
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text('Checkout'),
          ),
        ),
      ),
    );
  }
}
