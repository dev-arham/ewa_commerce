import 'package:ewa_store/common/styles/shadows.dart';
import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/common/widgets/icons/favorite_icon.dart';
import 'package:ewa_store/common/widgets/images/rounded_image.dart';
import 'package:ewa_store/common/widgets/texts/brand_title_text_with_verified_icon.dart';
import 'package:ewa_store/common/widgets/texts/product_price_text.dart';
import 'package:ewa_store/common/widgets/texts/product_title_text.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/features/shop/screens/product_details/product_details_screen.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCardVertical extends StatelessWidget {
  final ProductModel product;
  const ProductCardVertical({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            ShadowStyle.verticalProductShadow,
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: isDark ? TColors.darkerGrey : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 180,
              child: RoundedContainer(
                height: 180,
                padding: const EdgeInsets.all(TSizes.xs),
                backgroundColor: isDark ? TColors.dark : Colors.white,
                child: Stack(
                  children: [
                    Center(
                      child: RoundedImage(
                        imageUrl: product.images.first.url,
                        applyImageRadius: true,
                        isNetworkImage: true,
                      ),
                    ),
                    product.productDiscountPercentage == '0%'
                        ? const SizedBox.shrink()
                        : Positioned(
                            top: 4,
                            left: 4,
                            child: RoundedContainer(
                              borderRadius: TSizes.sm,
                              backgroundColor: TColors.primary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: TSizes.sm,
                                vertical: TSizes.xs,
                              ),
                              child: Text(
                                product.productDiscountPercentage,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .apply(
                                      color: TColors.white,
                                    ),
                              ),
                            ),
                          ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: FavoriteIcon(
                        productId: product.id,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product.name,
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  BrandTitleTextWithVerifiedIcon(
                    title: product.proBrand.name,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: TSizes.sm, bottom: TSizes.xs),
                  child: ProductPriceText(price: product.offerPrice.toString()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
