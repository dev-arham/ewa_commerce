import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.showBorder = false,
    this.border,
    this.backgroundColor = TColors.white,
    this.padding,
    this.borderRadius = TSizes.cardRadiusLg,
    this.margin,
    this.boderColor = TColors.borderPrimary,
  });

  final double? height, width;
  final bool showBorder;
  final BoxBorder? border;
  final Color backgroundColor;
  final Color boderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: boderColor) : null,
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
