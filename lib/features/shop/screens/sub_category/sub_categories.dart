import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/models/category_model.dart';
import 'package:ewa_store/features/shop/screens/sub_category/widgets/specific_sub_category_products.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final subcategories = DataController.to.allSubCategories
        .where((element) => element.categoryId == category.id)
        .toList();
    final products = DataController.to.allProducts
        .where((element) => element.proCategory.id == category.id)
        .toList();
    return Scaffold(
      appBar: CustomAppbar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: subcategories.length,
              separatorBuilder: (context, index) => const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
              itemBuilder: (context, index) {
                final subCategory = subcategories[index];
                final subCategoryProducts = products
                    .where((element) =>
                        element.proSubCategory.id == subCategory.id)
                    .toList();
                return Column(
                  children: [
                    SectionHeading(
                      title: subCategory.name,
                      onPressed: () {
                        Get.to(() => SpecificSubCategoryProducts(
                              subCategory: subCategory,
                              products: subCategoryProducts,
                            ));
                      },
                      showActionButton:
                          subCategoryProducts.isNotEmpty ? true : false,
                    ),
                    SizedBox(
                      height: subCategoryProducts.isNotEmpty
                          ? TSizes.spaceBtwSections / 2
                          : 0,
                    ),
                    if (subCategoryProducts.isEmpty)
                      Row(
                        children: [
                          const SizedBox(
                            height: TSizes.spaceBtwItems,
                          ),
                          Text(
                            'No products found!',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          
                        ],
                      )
                    else
                      SizedBox(
                        height: 130,
                        child: ListView.separated(
                          itemCount: subCategoryProducts.length,
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          itemBuilder: (context, index) =>
                              ProductCardHorizontal(
                            product: subCategoryProducts[index],
                          ),
                        ),
                      )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
