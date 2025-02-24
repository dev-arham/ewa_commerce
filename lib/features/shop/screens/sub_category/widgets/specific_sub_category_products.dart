import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ewa_store/features/shop/models/porduct_model.dart';
import 'package:ewa_store/features/shop/models/sub_category_model.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SpecificSubCategoryProducts extends StatelessWidget {
  final SubCategoryModel subCategory;
  final List<ProductModel> products;
  const SpecificSubCategoryProducts(
      {super.key, required this.subCategory, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(subCategory.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SortableProducts(products: products),
        ),
      ),
    );
  }
}
