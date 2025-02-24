import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/icons/circular_icon.dart';
import 'package:ewa_store/common/widgets/layouts/grid_layout.dart';
import 'package:ewa_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:ewa_store/common/widgets/shimmer_box/product_shimmer.dart';
import 'package:ewa_store/features/shop/controllers/wishlist_controller.dart';
import 'package:ewa_store/navigation_menu.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistController = WishlistController.to;
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          CircularIcon(
            icon: Iconsax.add,
            onPressed: () => NavigationController.to.selectedIndex.value = 1,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => wishlistController.productLoading.value
                    ? GridLayout(
                        mainAxisExtent: 260,
                        itemCount: 4,
                        itemBuilder: (_, index) => const ProductShimmer(),
                      )
                    : GridLayout(
                        itemCount: wishlistController.wishlistProducts.length,
                        itemBuilder: (_, index) => ProductCardVertical(
                          product: wishlistController.wishlistProducts[index],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
