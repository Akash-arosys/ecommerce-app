import 'package:real_estate/common/widgets/form_divider.dart';
import 'package:real_estate/common/widgets/social_icon.dart';
import 'package:real_estate/common/widgets/success_screen.dart';
import 'package:real_estate/features/authentication/screens/login.dart';
import 'package:real_estate/features/authentication/screens/verification.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/constants/text_string.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.user),
                              labelText: TTexts.firstName,
                            ),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwInputFields),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Iconsax.user),
                              labelText: TTexts.lastName,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user_edit),
                        labelText: TTexts.username,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.direct),
                        labelText: TTexts.email,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.call),
                        labelText: TTexts.phoneNo,
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwInputFields),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.password_check),
                        labelText: TTexts.password,
                        suffixIcon: Icon(Iconsax.eye_slash),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),

                    Row(
                      children: [
                        SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(value: true, onChanged: (value) {}),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${TTexts.iAgreeTo} ',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: TTexts.privacyPolicy,
                                style: Theme.of(context).textTheme.labelMedium!
                                    .apply(
                                      color: dark
                                          ? TColors.white
                                          : TColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? TColors.white
                                          : TColors.primary,
                                    ),
                              ),
                              TextSpan(
                                text: ' and ',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: TTexts.termsOfUse,
                                style: Theme.of(context).textTheme.labelMedium!
                                    .apply(
                                      color: dark
                                          ? TColors.white
                                          : TColors.primary,
                                      decoration: TextDecoration.underline,
                                      decorationColor: dark
                                          ? TColors.white
                                          : TColors.primary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(
                          () => VerificationScreen(
                            image: TImages.deliveredEmailIllustration,
                            title: TTexts.confirmEmail,
                            subtitle: TTexts.confirmEmailSubTitle,
                            buttonText: 'Continue',
                            email: "arosys@gamil.com",
                            onPressed: () => Get.to(
                              () => SuccessScreen(
                                image: TImages.staticSuccessIllustration,
                                title: TTexts.yourAccountCreatedTitle,
                                subTitle: TTexts.yourAccountCreatedSubTitle,
                                onPressed: () =>
                                    Get.to(() => const LoginScreen()),
                              ),
                            ),
                          ),
                        ),
                        child: const Text(TTexts.createAccount),
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),

              TFormDivider(titleText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              SocialIcons(),
            ],
          ),
        ),
      ),
    );
  }
}
