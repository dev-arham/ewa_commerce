import 'package:ewa_store/common/widgets/images/rounded_image.dart';
import 'package:ewa_store/common/widgets/texts/brand_title_text.dart';
import 'package:ewa_store/common/widgets/texts/product_title_text.dart';
import 'package:ewa_store/features/shop/models/cart_item_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.item,
  });

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Row(
      children: [
        RoundedImage(
          imageUrl: item.image ?? '',
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: isDark ? TColors.darkerGrey : TColors.light,
          isNetworkImage: true,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleText(title: item.brandName ?? ''),
              Flexible(
                child: ProductTitleText(
                  title: item.title,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
