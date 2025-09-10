import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/features/personalization/screens/address/address.dart';
import 'package:real_estate/features/personalization/screens/profile/widgets/setting_heading.dart';
import 'package:real_estate/features/personalization/screens/profile/widgets/setting_menu.dart';
import 'package:real_estate/features/shop/screens/cart/cart.dart';
import 'package:real_estate/features/shop/screens/order/order.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),
                  const SettingHeading(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  SettingMenuWidget(
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery addresss',
                    icon: Iconsax.safe_home,
                    onPress: () => Get.to(() => UserAddressScreen()),
                  ),
                  SettingMenuWidget(
                    title: 'My Cart',
                    subTitle: 'Add,remove products and move to checkout',
                    icon: Iconsax.shopping_cart,
                    onPress: () => Get.to(() => CartScreen()),
                  ),
                  SettingMenuWidget(
                    title: 'My Orders',
                    subTitle: 'In-progress and Completed Orders',
                    icon: Iconsax.bag_tick,
                    onPress: () => Get.to(() => OrderScreen()),
                  ),
                  SettingMenuWidget(
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and conneced accounts',
                    icon: Iconsax.security_card,
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  SizedBox(height: TSizes.spaceBtwItems),
                  SettingMenuWidget(
                    title: 'Load Data',
                    subTitle: 'Upload data to your cloud firebase',
                    icon: Iconsax.document_upload,
                  ),
                  SettingMenuWidget(
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    icon: Iconsax.location,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingMenuWidget(
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    icon: Iconsax.security_user,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingMenuWidget(
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to be seen',
                    icon: Iconsax.image,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _showLogoutModal() {
  //   Get.defaultDialog(
  //     title: "LOGOUT",
  //     titleStyle: const TextStyle(fontSize: 20),
  //     content: const Padding(padding: EdgeInsets.symmetric(vertical: 15.0), child: Text("Are you sure, you want to Logout?")),
  //     confirm: TPrimaryButton(isFullWidth: false, onPressed: () => AuthenticationRepository.instance.logout(), text: "Yes"),
  //     cancel: SizedBox(width: 100, child: OutlinedButton(onPressed: () => Get.back(), child: const Text("No"))),
  //   );
  // }
}
