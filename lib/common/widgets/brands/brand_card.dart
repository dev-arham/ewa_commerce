import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/common/widgets/texts/brand_title_text.dart';
import 'package:ewa_store/features/shop/models/brand_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/enums.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.showBorder,
    required this.brand,
    this.onPressed,
    this.width = 100,
    this.showBgColor = false,
    required this.productCount,
  });

  final BrandModel brand;
  final bool showBorder;
  final bool showBgColor;
  final double width;
  final void Function()? onPressed;
  final int productCount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: RoundedContainer(
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md, vertical: TSizes.sm),
        showBorder: showBorder,
        backgroundColor: showBgColor
            ? THelperFunctions.isDarkMode(context)
                ? TColors.darkContainer
                : TColors.lightContainer
            : Colors.transparent,
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BrandTitleText(
                title: brand.name,
                brandTextSize: TextSizes.large,
              ),
              Text(
                brand.subCategoryName,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.primary),
              ),
              Text(
                '$productCount products',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
