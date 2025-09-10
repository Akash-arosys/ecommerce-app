import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/features/shop/screens/order/orders_list.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = CartController.instance;
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// -- Items in Cart
        child: TOrderListItems(),
      ),
    );
  }
}
