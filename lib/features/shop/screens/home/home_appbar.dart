import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/products/cart/card_menu_icon.dart';
import 'package:real_estate/features/shop/screens/cart/cart.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: TColors.white),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () => Get.to(() => CartScreen()),
          iconColor: TColors.white,
        ),
      ],
    );
  }
}
