import 'package:real_estate/common/widgets/image_text_widget/circular_image.dart';
import 'package:real_estate/features/personalization/screens/profile/profile.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingHeading extends StatelessWidget {
  const SettingHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Arosys Technologies',
        style: Theme.of(
          context,
        ).textTheme.headlineSmall!.apply(color: TColors.white),
      ),
      subtitle: Text(
        'Arosys@gmail.com',
        style: Theme.of(
          context,
        ).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(() => ProfileScreen()),
        icon: Icon(Iconsax.edit),
      ),
    );
  }
}
