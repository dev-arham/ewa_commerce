import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({
    super.key,
    required this.price,
    this.currencySign = 'PKR',
    this.isLarge = false,
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final bool isLarge;
  final int maxLines;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$currencySign $price",
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
    );
  }
}
