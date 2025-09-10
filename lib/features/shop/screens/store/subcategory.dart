import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/image_text_widget/rounded_image.dart';
import 'package:real_estate/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubcategoryScreen extends StatelessWidget {
  const SubcategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Sports shirts'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TRoundedImage(
                imageUrl: TImages.promoBanner1,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              SizedBox(height: TSizes.spaceBtwSections),

              Column(
                children: [
                  TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) {
                        return const TProductCardHorizontal();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
