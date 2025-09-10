import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/features/personalization/screens/address/add_new_address.dart';
import 'package:real_estate/features/personalization/screens/address/widgets/single_address.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        backgroundColor: TColors.primary,
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(isAddressSelected: true),
              TSingleAddress(isAddressSelected: false),
              TSingleAddress(isAddressSelected: false),
              TSingleAddress(isAddressSelected: false),
              TSingleAddress(isAddressSelected: false),
            ],
          ),
        ),
      ),
    );
  }
}
