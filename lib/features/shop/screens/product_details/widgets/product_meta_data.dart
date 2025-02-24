import 'package:ewa_store/common/widgets/texts/brand_title_text.dart';
import 'package:ewa_store/common/widgets/texts/product_price_text.dart';
import 'package:ewa_store/common/widgets/texts/product_title_text.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/enums.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductMetaData extends StatelessWidget {
  final ProductModel product;
  const ProductMetaData({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        ProductTitleText(
          title: product.name,
          maxLines: 2,
        ),
        const SizedBox(height: TSizes.xs),
        BrandTitleText(
          title: product.proBrand.name,
          brandTextSize: TextSizes.medium,
          textColor: TColors.primary,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        product.price == product.offerPrice
            ? ProductPriceText(
                price: product.offerPrice.toString(),
                isLarge: true,
              )
            : Row(
                children: [
                  Text(
                    product.price.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  ProductPriceText(
                    price: product.offerPrice.toString(),
                    isLarge: true,
                  )
                ],
              ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            const ProductTitleText(
              title: "Status",
              smallSize: true,
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text(
              product.totalQuantity > 0 ? "In Stock" : "In Stock",
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color:
                        product.totalQuantity > 0 ? Colors.green : Colors.red,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
