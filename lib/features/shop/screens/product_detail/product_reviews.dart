import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/features/shop/models/review_model.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/rating_progress_indicator.dart';
import 'package:real_estate/features/shop/screens/product_detail/widgets/user_review_card.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({
    super.key,
    required this.reviews,
    required this.rating,
  });
  final List<Review> reviews;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ratings and reviews are verified and are from people who use the same type of device that you use.',
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              //  Overall Product Ratings
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      rating.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        TRatingProgessIndicator(text: '5', value: 1.0),
                        TRatingProgessIndicator(text: '4', value: 0.8),
                        TRatingProgessIndicator(text: '3', value: 0.6),
                        TRatingProgessIndicator(text: '2', value: 0.4),
                        TRatingProgessIndicator(text: '1', value: 0.2),
                      ],
                    ),
                  ),
                ],
              ),

              RatingBarIndicator(
                rating: rating,
                itemSize: 20,
                unratedColor: TColors.darkGrey,
                itemBuilder: (_, __) =>
                    Icon(Iconsax.star1, color: TColors.primary),
              ),
              Text(
                reviews.length.toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              ...reviews.map((element) => UserReviewCard(reviewdata: element)),
              // User Reviews List
            ],
          ),
        ),
      ),
    );
  }
}
