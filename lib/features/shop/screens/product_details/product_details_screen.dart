import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/features/shop/screens/cart/cart_screen.dart';
import 'package:ewa_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(product: product),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: isDark ? TColors.dark : TColors.lightGrey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: 140,
                child: DrawerHeader(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  decoration: const BoxDecoration(color: TColors.black),
                  child: const Text(
                    'Cart Items',
                    style: TextStyle(color: TColors.white, fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace / 2,
                ),
                child: CartItems(),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace / 2,
                ),
                child: OutlinedButton(
                  onPressed: () => Get.back(),
                  child: const Text("Continue Shopping"),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace / 2,
                ),
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const CartScreen()),
                  child: const Text("To Cart"),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(images: product.images, productId: product.id),
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingAndShare(
                    discountText: product.productDiscountPercentage,
                  ),
                  ProductMetaData(product: product),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SectionHeading(
                    title: "Description",
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary,
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const SectionHeading(
                  //       title: "Reviews",
                  //       showActionButton: false,
                  //     ),
                  //     IconButton(
                  //       onPressed: () =>
                  //           Get.to(() => const ProductReviewsScreen()),
                  //       icon: const Icon(Iconsax.arrow_right_3),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
