import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/layouts/grid_layout.dart';
import 'package:ewa_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ewa_store/common/widgets/shimmer_box/product_shimmer.dart';
import 'package:ewa_store/features/shop/controllers/search_controller.dart';
import 'package:ewa_store/utils/constants/image_strings.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchScreenController());
    return Scaffold(
      appBar: CustomAppbar(showBackArrow: true, title: const Text("Search")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.searchTextController,
                      decoration: const InputDecoration(
                        hintText: 'Search for products',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.searchProducts();
                    },
                    icon: const Icon(Iconsax.search_normal),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Obx(
                () =>
                    controller.productLoading.value
                        ? GridLayout(
                          itemCount: 4,
                          mainAxisExtent: 260,
                          itemBuilder: (context, index) {
                            return ProductShimmer();
                          },
                        )
                        : controller.searchResults.isEmpty
                        ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(TImages.emptyCartAnimation),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              const Text('Enter item name to search'),
                            ],
                          ),
                        )
                        : GridLayout(
                          itemCount: controller.searchResults.length,
                          itemBuilder: (context, index) {
                            final product = controller.searchResults[index];
                            return ProductCardVertical(product: product);
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
