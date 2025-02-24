import 'package:ewa_store/common/widgets/chips/custom_choice_chip.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  final ProductVariant productVariant;
  const ProductAttributes({super.key, required this.productVariant});

  @override
  Widget build(BuildContext context) {
    Variant selectedvariant = productVariant.variants[0];
    return Column(
      children: [
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              title: productVariant.variantType,
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: productVariant.variants.length,
                separatorBuilder: (_, __) => const SizedBox(
                  width: TSizes.sm,
                ),
                itemBuilder: (context, index) {
                  return CustomChoiceChip(
                    variant: productVariant.variants[index],
                    isSelected:
                        selectedvariant == productVariant.variants[index],
                    onSelected: (value) {
                      selectedvariant = productVariant.variants[index];
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
