import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataController = DataController.to;
    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
        title: Text("Popular Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SortableProducts(products: dataController.allProducts),
        ),
      ),
    );
  }
}
