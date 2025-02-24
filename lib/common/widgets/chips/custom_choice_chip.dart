import 'package:ewa_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.variant,
    required this.isSelected,
    this.onSelected,
  });

  final Variant variant;
  final bool isSelected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = THelperFunctions.getColor(variant.variantName) != null;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.transparent,
      ),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(variant.variantName),
        selected: isSelected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: isSelected ? TColors.white : null),
        avatar: isColor
            ? CircularContainer(
                width: 50,
                height: 50,
                backgroundColor: THelperFunctions.getColor(variant.variantName)!,
              )
            : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ? const EdgeInsets.all(0) : null,
        backgroundColor: isColor ? THelperFunctions.getColor(variant.variantName)! : null,
      ),
    );
  }
}
