import 'package:ewa_store/common/widgets/texts/brand_title_text.dart';
import 'package:ewa_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class BrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const BrandTitleTextWithVerifiedIcon({
    super.key,
    this.textColor,
    this.maxLines = 1,
    required this.title,
    this.iconColor = Colors.blue,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
    this.width = 100,
  });

  final String title;
  final int maxLines;
  final double width;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BrandTitleText(
            title: title,
            textAlign: textAlign,
            maxLines: maxLines,
            brandTextSize: brandTextSize,
            textColor: textColor,
          ),
        ],
      ),
    );
  }
}
