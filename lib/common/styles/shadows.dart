import 'package:ewa_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 20,
    spreadRadius: 0,
    offset: const Offset(0, 0),
  );

  static final horizontalProductShadow = BoxShadow(
    color: TColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 0),
  );
}
