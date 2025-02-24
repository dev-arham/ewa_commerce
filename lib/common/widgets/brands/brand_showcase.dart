import 'package:cached_network_image/cached_network_image.dart';
import 'package:ewa_store/common/widgets/brands/brand_card.dart';
import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/features/shop/models/brand_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandShowcase extends StatelessWidget {
  const BrandShowcase({
    super.key,
    required this.images,
    required this.brandModel,
    required this.onPressed,
    required this.productCount,
  });

  final void Function()? onPressed;
  final List<String> images;
  final BrandModel brandModel;
  final int productCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RoundedContainer(
        showBorder: true,
        boderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          children: [
            BrandCard(
              showBorder: false,
              brand: brandModel,
              productCount: productCount,
            ),
            images.isEmpty
                ? const SizedBox()
                : SizedBox(
                    height: 100,
                    child: ListView.separated(
                      itemCount: images.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      itemBuilder: (context, index) {
                        return brandTopProductImageWidget(images[index], context);
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return RoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: CachedNetworkImage(imageUrl: image));
  }
}
