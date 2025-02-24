import 'package:ewa_store/common/widgets/appbar/appbar.dart';
import 'package:ewa_store/common/widgets/appbar/tabbar.dart';
import 'package:ewa_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ewa_store/common/widgets/layouts/grid_layout.dart';
import 'package:ewa_store/common/widgets/products/cart/cart_counter_icon.dart';
import 'package:ewa_store/common/widgets/texts/section_heading.dart';
import 'package:ewa_store/common/widgets/brands/brand_card.dart';
import 'package:ewa_store/features/shop/controllers/data_controller.dart';
import 'package:ewa_store/features/shop/screens/brands/all_brands_screen.dart';
import 'package:ewa_store/features/shop/screens/brands/brand_products_screen.dart';
import 'package:ewa_store/features/shop/screens/search/search_screen.dart';
import 'package:ewa_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:ewa_store/utils/constants/colors.dart';
import 'package:ewa_store/utils/constants/sizes.dart';
import 'package:ewa_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = DataController.to.allCategories;
    final brands = DataController.to.allBrands;
    final products = DataController.to.allProducts;

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: CustomAppbar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [CartCounterIcon()],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      SearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                        onTap: () => Get.to(() => const SearchScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => const AllBrandsScreen()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),
                      GridLayout(
                        itemCount: brands.length > 4 ? brands.length : 4,
                        mainAxisExtent: 85,
                        itemBuilder: (_, index) {
                          return BrandCard(
                            productCount:
                                products
                                    .where(
                                      (element) =>
                                          element.proBrand.id ==
                                          brands.elementAt(0).id,
                                    )
                                    .length,
                            showBorder: false,
                            showBgColor: true,
                            brand: brands[index],
                            onPressed:
                                () => Get.to(
                                  () =>
                                      BrandProductsScreen(brand: brands[index]),
                                ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                bottom: CustomTabbar(
                  tabs:
                      categories.map((category) {
                        return Tab(child: Text(category.name));
                      }).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children:
                categories
                    .map((category) => CategoryTab(category: category))
                    .toList(),
          ),
        ),
      ),
    );
  }
}
