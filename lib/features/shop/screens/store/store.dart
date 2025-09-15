import 'package:real_estate/common/widgets/appbar.dart';
import 'package:real_estate/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:real_estate/common/widgets/grid_layout.dart';
import 'package:real_estate/common/widgets/products/cart/card_menu_icon.dart';
import 'package:real_estate/common/widgets/products/product_card/brand_card.dart';
import 'package:real_estate/common/widgets/tabbar.dart';
import 'package:real_estate/common/widgets/text/section_header.dart';
import 'package:real_estate/data/dummy_data.dart';
import 'package:real_estate/features/shop/models/brand_model.dart';
import 'package:real_estate/features/shop/models/product_model.dart';
import 'package:real_estate/features/shop/screens/cart/cart.dart';
import 'package:real_estate/features/shop/screens/store/allproduct.dart';
import 'package:real_estate/features/shop/screens/store/category_tab.dart';
import 'package:real_estate/utils/constants/colors.dart';
import 'package:real_estate/utils/constants/image_strings.dart';
import 'package:real_estate/utils/constants/sizes.dart';
import 'package:real_estate/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(onPressed: () => Get.to(() => CartScreen())),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: 'Search in Store',
                        showBackground: false,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(height: TSizes.spaceBtwSections),

                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {},
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (contex, index) {
                          final brands = dummyBrands[index];
                          List<Product> filteredProducts = dummyProducts
                              .where(
                                (product) => product.brand?.id == brands.id,
                              )
                              .toList();
                          return TbrandCard(
                            text: brands.name,
                            image: brands.image ?? TImages.default404,
                            subText: '${filteredProducts.length} products',
                            onTap: () => Get.to(
                              () => AllProductsScreen(
                                title: brands.name,
                                products: filteredProducts,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                bottom: TTabBar(
                  tabs: dummyCategories.map((element) {
                    return Tab(child: Text(element.name));
                  }).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: dummyCategories.map((element) {
              return TCategoryTab(
                categoryId: element.id,
                categoryName: element.name,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
