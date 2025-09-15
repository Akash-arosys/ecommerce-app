import 'package:real_estate/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({super.key});

  // final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    // final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {},
      leading: TRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.white
            : TColors.white,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Image(
          image: AssetImage(TImages.paypalLogo),
          fit: BoxFit.contain,
        ),
      ),
      title: Text('PayTm'),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
