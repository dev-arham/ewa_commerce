import 'package:ewa_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ewa_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ewa_store/common/widgets/layouts/grid_layout.dart';
import 'package:ewa_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ewa_store/common/widgets/shimmer_box/product_shimmer.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/screens/all_products/all_products_screen.dart';
import 'package:ewa_store/features/shop/screens/home/widgets/home_app_bar.dart';
import 'package:ewa_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:ewa_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ewa_store/features/shop/screens/search/search_screen.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = Get.put(DataController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                children: [
                  HomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                  SearchContainer(
                    text: 'Search for products',
                    onTap: () {
                      Get.to(() => const SearchScreen());
                    },
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        HomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const PromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProductsScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Obx(
                    () =>
                    
                        dataController.productLoading.value
                            ? GridLayout(
                              itemCount: 4,
                              mainAxisExtent: 240,
                              itemBuilder: (_, index) => const ProductShimmer(),
                            )
                            : GridLayout(
                              itemCount:
                                  dataController.allProducts.length < 6
                                      ? dataController.allProducts.length
                                      : 6,
                              itemBuilder:
                                  (_, index) => ProductCardVertical(
                                    product: dataController.allProducts[index],
                                  ),
                            ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
