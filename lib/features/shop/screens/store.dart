import 'package:e_comm_app/common/Widgets/appbar/appbar.dart';
import 'package:e_comm_app/common/Widgets/brad_name.dart';
import 'package:e_comm_app/common/Widgets/home_cart_icon.dart';
import 'package:e_comm_app/common/Widgets/rounded_container.dart';
import 'package:e_comm_app/common/Widgets/search_bar.dart';
import 'package:e_comm_app/common/Widgets/section_heading.dart';
import 'package:e_comm_app/common/layout/grid_layout.dart';
import 'package:e_comm_app/features/authentication/models/productmodel.dart';
import 'package:e_comm_app/features/shop/screens/brand_products.dart';
import 'package:e_comm_app/utils/constants/colors.dart';
import 'package:e_comm_app/utils/constants/size.dart';
import 'package:e_comm_app/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Store extends StatelessWidget {
  const Store({super.key, });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ECAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [HomeCartIcon()],
        ),
        body: Padding(
          padding: const EdgeInsets.all(ECSize.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SearchBarHome(hintText: 'Search in store'),
                const SizedBox(height: ECSize.defaultSpace),
                const ECSectionHeading(
                    text: 'Featured Brands',
                    buttonText: 'View all',
                    padding: EdgeInsets.symmetric(vertical: 10)),
                ECGridLayout(
                    //  mainAxisIntent: 80,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                           Get.to(()=> BrandProducts());
                        },
                        child: const ECRoundedContainer(
                          backgroundColor: Colors.transparent,
                          borderColor: Colors.grey,
                          showBorder: true,
                          height: 80,
                          width: 180,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(Iconsax.additem),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ECBrandName(brandName: 'Armani exchange'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 4),
                TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorColor: ECColors.primary,
                    unselectedLabelColor: Colors.grey,
                    padding: const EdgeInsets.only(top: 20),
                    labelColor: ECHelperFunctions.isDarkMode(context)
                        ? Colors.white
                        : Colors.black,
                    tabs: const [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Cosmetics'))
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
