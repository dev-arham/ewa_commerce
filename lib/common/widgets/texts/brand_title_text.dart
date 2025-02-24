import 'package:ewa_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    required this.title,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.brandTextSize = TextSizes.small,
    this.textColor,
  });

  final String title;
  final TextAlign? textAlign;
  final int maxLines;
  final TextSizes brandTextSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SizedBox(
        child: Text(
          title,
          textAlign: textAlign,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          style: brandTextSize == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium!.apply(color: textColor)
              : brandTextSize == TextSizes.medium
                  ? Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: textColor)
                  : brandTextSize == TextSizes.large
                      ? Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: textColor)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: textColor),
        ),
      ),
    );
  }
}
