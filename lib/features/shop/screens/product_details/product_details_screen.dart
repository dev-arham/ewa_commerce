import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:ewa_store/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(product: product),
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
