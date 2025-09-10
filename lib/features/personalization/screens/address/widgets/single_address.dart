import 'package:real_estate/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({
    super.key,
    // required this.address,
    this.onTap,
    required this.isAddressSelected,
  });

  // final AddressModel address;
  final VoidCallback? onTap;
  final bool isAddressSelected;

  @override
  Widget build(BuildContext context) {
    // final controller = AddressController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(TSizes.md),
        width: double.infinity,
        backgroundColor: isAddressSelected
            ? TColors.dashboardAppbarBackground.withValues(alpha: 0.5)
            : Colors.transparent,
        borderColor: isAddressSelected
            ? Colors.transparent
            : dark
            ? TColors.darkerGrey
            : TColors.grey,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Stack(
          children: [
            Positioned(
              right: 5,
              top: 0,
              child: Icon(
                isAddressSelected ? Iconsax.tick_circle : Iconsax.tick_circle1,
                color: isAddressSelected
                    ? TColors.dashboardAppbarBackground
                    : dark
                    ? TColors.darkerGrey
                    : TColors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address 1',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: TSizes.sm / 2),
                Text(
                  '9876543234',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: TSizes.sm / 2),
                Text('aadarsh nagar camp-1 bhilai', softWrap: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
