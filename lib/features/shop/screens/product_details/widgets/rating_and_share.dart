import 'package:ewa_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({
    super.key,
    required this.discountText,
  });
  final String discountText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        discountText == '0%'
            ? const SizedBox.shrink()
            : RoundedContainer(
                borderRadius: TSizes.sm,
                backgroundColor: TColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm,
                  vertical: TSizes.xs,
                ),
                child: Text(
                  "$discountText OFF",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.white),
                ),
              ),
      ],
    );
  }
}
